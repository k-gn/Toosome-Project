const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const eventDate = document.querySelector('#eventDate'); // 작성일 기간선택
const eventDatePeriod = document.querySelector('#eventDatePeriod'); // 작성일 기간선택 버튼박스
const eventPeriods = document.querySelectorAll('.period.event'); // 작성일 기간 버튼들
const eventCalendar = document.querySelector('#calendar1'); // 작성일 달력1
const eventCalendar2 = document.querySelector('#calendar2'); // 작성일 달력2
const eventCalendar3 = document.querySelector('#calendar3'); // 작성일 달력3
const eventCalendar4 = document.querySelector('#calendar4'); // 작성일 달력4
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const boardContainer = document.querySelector('#board-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블
const pagination = document.getElementById('pagination'); // 페이징

let board = {};
let keyword = ''; // 검색 제목
let startRegDate = ''; // 검색 시작일
let endRegDate = ''; // 검색 종료일
let currentPage = 1; // 현재 페이지
let rows = 10000; // 한 페이지에 보여줄 게시글 수

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'use') {
		eventDatePeriod.style.display = 'inline';
	} else {
		eventDatePeriod.style.display = 'none';
	};
};

// on 클래스 제거
const removeOn = (periods) => {
	periods.forEach((period) => {
		if(period.classList.contains('on')) {
			period.classList.remove('on');			
		}
	});
};

// 날짜 계산 (moment.js)
const calcDate = (value, calendar) => {
	const [num, unit] = value.split('');
	const today = moment();
	const newDate = moment(today).subtract(num, unit).format('YYYY-MM-DD');
	calendar.value = newDate;
};

// init
const calendarInit = () => {
	removeOn(eventPeriods);
	const today = moment().format('YYYY-MM-DD');
	eventCalendar.value = today;
	eventCalendar2.value = today;
	eventCalendar3.value = today;
	eventCalendar4.value = today;
};

// 기간 버튼 event hook
eventPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(eventPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, eventCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchInput.value = '';
	eventDate.options[0].selected = 'true';
	eventDatePeriod.style.display = 'none';
	calendarInit();
};

resetBtn.addEventListener('click', resetHandler);

// 페이지네이션 세팅
const setPagination = (items, wrapper, rowsPerPage) => {
	wrapper.innerHTML = ""; // 페이징 초기화
	
	// 총 페이징 숫자
	let pageCount = Math.ceil(items.length / rowsPerPage);
	for(let i = 1; i < pageCount + 1; i++) {
		let btn = paginationBtn(i, items);
		wrapper.appendChild(btn);
	};
};

// 페이지네이션 버튼 생성 후 반환
const paginationBtn = (page, items) => {
	let btn = document.createElement('button');
	btn.innerText = page;
	// 현재 페이지에서 showing 활성화
	if(currentPage == page) {
		btn.classList.add('showing');
	};
	
	btn.addEventListener('click', (e) => btnHandler(e,items,page));
	return btn;
};

// 페이지네이션 버튼 핸들러
const btnHandler = (e,items,page) => {
	// 현재 페이지 이동
	currentPage = page;
	// 누른 페이지 데이터 출력
	showList(items, listTable, rows, currentPage);
	// 이전 버튼 비활성화
	let currentBtn = document.querySelector('#pagination button.showing');
	currentBtn.classList.remove('showing');
	// 누른 버튼 활성화
	e.target.classList.add('showing');	
};

// 리스트 출력하기
const showList = (result, wrapper, rowsPerPage, page) => {
	wrapper.innerHTML = ''; // 테이블 초기화
	page--;
	
	// 검색 결과가 없을 경우
	if(result.length === 0) {
		let newItem = document.createElement('tr');
		let itemElement = `
			<td colspan="6">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	};
	
	// 페이징처리 & 데이터 출력	
	let start = rowsPerPage * page; // 시작 번호
	let end = start + rowsPerPage; // 끝 번호
	// 데이터를 rows만큼 끊어온다
	let paginatedItems = result.slice(start, end);
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < paginatedItems.length; i++) {
		let item = paginatedItems[i];

		let newEl = document.createElement('tr');
		let content = `
          <td>
            ${item.eventBoardId}
          </td>
          <td onclick="listHandler(this);">
			<a href="#">
	          ${item.eventBoardTitle}
			</a>
          </td>
          <td>
            ${item.eventBoardViewCount}
          </td>
          <td>
            ${item.eventBoardDetailVO.eventBoardDetailDay}
          </td>
          <td>
            ${item.eventBoardStartday}
          </td>
          <td>
            ${item.eventBoardEndday}
          </td>
          <td>
            <a target="_blank" href="https://toosome.s3.ap-northeast-2.amazonaws.com/${item.eventBoardDetailVO.eventBoardDetailImageRoute}/${item.eventBoardDetailVO.eventBoardDetailImageName}.${item.eventBoardDetailVO.eventBoardDetailImageExtention}">상세보기</a>
          </td>
		`;
		newEl.innerHTML = content;
		wrapper.appendChild(newEl);
	};	
};

// AJAX 검색 리스트 불러오기
const getList = (url, board, wrapper, rowsPerPage, page) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: board, //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log(result);
			// 검색 건수 출력
			let count = `검색 결과 : ${result.length}건`;
			searchResult.innerText = count;
			showList(result, wrapper, rowsPerPage, page);
			setPagination(result, pagination, rows);
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	keyword = ''; // 검색 제목
	startRegDate = ''; // 검색 시작일
	endRegDate = ''; // 검색 종료일
	
	// 검색 이름
	if(searchInput.value !== '') {
		keyword = searchInput.value;	
	};
	
	// 가입일자
	if(eventDate.options[eventDate.selectedIndex].value === 'use') {
		startRegDate = moment(eventCalendar.value).format('YYYY-MM-DD');
		endRegDate = moment(eventCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	board = {
		keyword,
		startRegDate,
		endRegDate,
	};
	url = '/admin/eventboardsearch';
	getList(url, board, listTable, rows, currentPage);
};

submitBtn.addEventListener('click', submitHandler);

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainer.style.display = 'none';
});

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			$("input[name=eventBoardId]").val(res.eventBoardId);			
			$("input[name=eventBoardViewCount]").val(res.eventBoardViewCount);			
			$("input[name=eventBoardDetailDay]").val(res.eventBoardDetailVO.eventBoardDetailDay);			
			$("input[name=eventBoardStartday]").val(res.eventBoardStartday);			
			$("input[name=eventBoardEndday]").val(res.eventBoardEndday);			
			$("input[name=eventBoardTitle]").val(res.eventBoardTitle);
			let imageURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/event/${res.eventBoardImageRoute}/${res.eventBoardImageName}.${res.eventBoardImageExtention}`;			
			$("#eventBoardImage").attr("src",imageURL);			
			let thumbnailURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/event/${res.eventBoardDetailVO.eventBoardDetailImageRoute}/${res.eventBoardDetailVO.eventBoardDetailImageName}.${res.eventBoardDetailVO.eventBoardDetailImageExtention}`;			
			$("#eventBoardThumbnail").attr("src",thumbnailURL);			
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	boardContainer.style.display = 'block';
	$("input[name=eventBoardTitle]").focus();
};

// 정렬 select 핸들러
const selectHandler = (select) => {
	// selected value
	let value = select.options[select.selectedIndex].value;
	
	// init
	currentPage = 1;
	rows = +value;
	url = '/admin/eventboardmanagement';
	getList(url, board, listTable, rows, currentPage);
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	url = '/admin/eventboardmanagement';
	getList(url, board, listTable, rows, currentPage); 
}); 

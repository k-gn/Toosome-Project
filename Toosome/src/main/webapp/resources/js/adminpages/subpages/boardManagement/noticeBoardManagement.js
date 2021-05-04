const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const noticeDate = document.querySelector('#noticeDate'); // 작성일 기간선택
const noticeDatePeriod = document.querySelector('#noticeDatePeriod'); // 작성일 기간선택 버튼박스
const noticePeriods = document.querySelectorAll('.period.notice'); // 작성일 기간 버튼들
const noticeCalendar = document.querySelector('#calendar1'); // 작성일 달력1
const noticeCalendar2 = document.querySelector('#calendar2'); // 작성일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const boardContainer = document.querySelector('#board-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블
const enrollSubmitBtn = document.querySelector('#enroll-submit'); // 글등록 버튼
const updateSubmitBtn = document.querySelector('#update-submit'); // 업데이트 버튼


let board = {};
let keyword = ''; // 검색 제목
let startRegDate = ''; // 검색 시작일
let endRegDate = ''; // 검색 종료일
let rows = 10000;
let boardId = '';

// 글 등록 유효성 검사
const enrollCheck = (title, content) => {
	if(title.value === '') {
		alert('제목 입력란이 비어있습니다.');
		title.focus();
		return false;
	} else if (content.value === '') {
		alert('내용 입력란이 비어있습니다.');
		content.focus();
		return false;
	}
	return true;
};

// 글등록 버튼 event hook
enrollSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const e_title = document.querySelector('#enroll-title');
	const e_content = document.querySelector('#enroll-content');
	
	if(!enrollCheck(e_title, e_content)) {
		return;
	} else {
		document.querySelector('#enroll-form').submit();
	}
});

// 업데이트 버튼 event hook
updateSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const u_title = document.querySelector('#detail-title');
	const u_content = document.querySelector('#detail-content');
	
	if(!enrollCheck(u_title, u_content)) {
		return;
	} else {
		document.querySelector('#update-form').submit();
	}
});

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'use') {
		noticeDatePeriod.style.display = 'inline';
	} else {
		noticeDatePeriod.style.display = 'none';
	};
};

// 글 삭제 버튼
const delBtnFunc = ()  => {
	let flag = confirm('정말로 삭제하시겠습니까?');
	if(flag) {
		$.ajax({
			type: 'get',
			url: '/admin/noticeboard-delete/',
			headers: {
				"Content-Type": "application/json"
			}, //요청 헤더 정보
			data: {
				noticeBoardId: boardId
			},
			success: () => {
				
			},
			error: () => {
				alert('통신장애');
				window.history.back();
			}
		})
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
	removeOn(noticePeriods);
	const today = moment().format('YYYY-MM-DD');
	noticeCalendar.value = today;
	noticeCalendar2.value = today;
};

// 기간 버튼 event hook
noticePeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(noticePeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, noticeCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	noticeDate.options[0].selected = 'true';
	noticeDatePeriod.style.display = 'none';
	calendarInit();
};

resetBtn.addEventListener('click', resetHandler);

// 리스트 출력하기
const showList = (result, wrapper) => {
	wrapper.innerHTML = ''; // 테이블 초기화
	// 검색 결과가 없을 경우
	if(result.length === 0) {
		let newItem = document.createElement('tr');
		let itemElement = `
			<td colspan="5">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	};
	
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < result.length; i++) {

		let newEl = document.createElement('tr');
		newEl.setAttribute( 'onclick', 'listHandler(this)' );
		let content = `
          <td>
            ${result[i].noticeBoardId}
          </td>
          <td>
            ${result[i].noticeBoardTitle}
          </td>
          <td>
            ${result[i].noticeBoardContent}
          </td>
          <td>
            ${result[i].noticeBoardViewCount}
          </td>
          <td>
            ${result[i].noticeBoardRegdate}
          </td>
		`;
		newEl.innerHTML = content;
		wrapper.appendChild(newEl);
	};	
};

// 페이징 처리 후 데이터 출력
const setData = (result, wrapper, rows) => {
	$('#pagination').pagination({
	    dataSource: result,
	    pageSize: rows,
	    pageNumber: 1,
	    callback: function(data, pagination) {
			showList(data, wrapper);					
	    }
	});
};

// AJAX 검색 리스트 불러오기
const getList = (board, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/noticeboardmanagement", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: board, //서버로 전송할 데이터
		success: (result) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 검색 건수 출력
			let count = `검색 결과 : ${result.length}건`;
			searchResult.innerText = count;
			setData(result, wrapper, rows);
		}, 
		error: () => {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	condition = ''; // 검색 타입
	keyword = ''; // 검색 제목
	startRegDate = ''; // 검색 시작일
	endRegDate = ''; // 검색 종료일
	
	// 검색 이름 & 검색 이메일
	condition = searchType.options[searchType.selectedIndex].value; // 제목으로 검색시
	keyword = searchInput.value;	
	
	// 가입일자
	if(noticeDate.options[noticeDate.selectedIndex].value === 'use') {
		startRegDate = moment(noticeCalendar.value).format('YYYY-MM-DD');
		endRegDate = moment(noticeCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	board = {
		condition,
		keyword,
		startRegDate,
		endRegDate,
	};
	
	rows = 10000;
	getList(board, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/noticeboarddetail", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		data: {
			noticeBoardId: id
		},
		dataType: "json", //응답받을 데이터의 형태
		success: (res) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			boardId = res[0].noticeBoardId;
			$('input[name=noticeBoardId]').val(res[0].noticeBoardId);			
			$('input[name=noticeBoardViewCount]').val(res[0].noticeBoardViewCount);			
			$('input[name=noticeBoardRegdate]').val(res[0].noticeBoardRegdate);	
			$('#detail-title').val(res[0].noticeBoardTitle);		
			$('#detail-content').val(res[0].noticeBoardContent);		
		}, 
		error: () => {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	boardContainer.style.display = 'block';
	$("#detail-title").focus();
};

// 정렬 select 핸들러
const selectHandler = (select) => {
	// selected value
	let value = select.options[select.selectedIndex].value;
	
	// init
	rows = +value;
	
	getList(board, listTable, rows);
};

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainer.style.display = 'none';
});

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	getList(board, listTable, rows);
}); 

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
const enrollSubmitBtn = document.querySelector('#enroll-submit'); // 글등록 버튼
const updateSubmitBtn = document.querySelector('#update-submit'); // 업데이트 버튼

let board = {};
let keyword = ''; // 검색 제목
let startRegDate = ''; // 검색 시작일
let endRegDate = ''; // 검색 종료일
let rows = 10000;
let boardId = '';

// 글 등록 유효성 검사
const enrollCheck = (title,thumb,image,startDate,endDate) => {
	if(title.value === '') {
		alert('제목 입력란이 비어있습니다.');
		title.focus();
		return false;
	} else if(startDate.value === '') {
		alert('이벤트 시작일을 선택하세요.');
		startDate.focus();
		return false;
	} else if (endDate.value === '') {
		alert('이벤트 종료일을 선택하세요.');
		endDate.focus();
		return false;
	} else if (startDate.value > endDate.value) {
		alert('이벤트 시작일은 종료일보다 이후일 수 없습니다');
		startDate.focus();
		return false;
	} else if (thumb.value === '') {
		alert('썸네일 이미지를 선택하세요.');
		thumb.focus();
		return false;
	} else if (image.value === '') {
		alert('본문 이미지를 선택하세요.');
		image.focus();
		return false;
	};
	return true;
};

// 업데이트 유효성 검사
const updateCheck = (title,startDate,endDate) => {
	if(title.value === '') {
		alert('제목 입력란이 비어있습니다.');
		title.focus();
		return false;
	} else if(startDate.value === '') {
		alert('이벤트 시작일을 선택하세요.');
		startDate.focus();
		return false;
	} else if (endDate.value === '') {
		alert('이벤트 종료일을 선택하세요.');
		endDate.focus();
		return false;
	} else if (startDate.value > endDate.value) {
		alert('이벤트 시작일은 종료일보다 이후일 수 없습니다');
		startDate.focus();
		return false;
	}
	return true;
};

// 글등록 버튼 event hook
enrollSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const e_title = document.querySelector('#enroll-title');
	const e_thumb = document.querySelector('#enroll-thumb');
	const e_image = document.querySelector('#enroll-image');
	
	if(!enrollCheck(e_title,e_thumb,e_image,eventCalendar3,eventCalendar4)) {
		return;
	} else {
		document.querySelector('#enroll-form').submit();
	}
});

// 업데이트 버튼 event hook
updateSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const u_title = document.querySelector('#detail-title');
	const u_start = document.querySelector('#detail-start');
	const u_end = document.querySelector('#detail-end');
	
	if(!updateCheck(u_title,u_start,u_end)) {
		return;
	} else {
		document.querySelector('#update-form').submit();
	}
});


// 글 삭제 버튼
const delBtnFunc = ()  => {
	let flag = confirm('정말로 삭제하시겠습니까?');
	if(flag) {
		$.ajax({
			type: 'post',
			url: `/admin/eventboard-delete/${boardId}`,
			error: () => {
				alert('통신장애');
				window.history.back();
			}
		})
	};
};

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

// 리스트 출력하기
const showList = (result, wrapper) => {
	wrapper.innerHTML = ''; // 테이블 초기화
	
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
	
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < result.length; i++) {

		let newEl = document.createElement('tr');
		let content = `
          <td>
            ${result[i].eventBoardId}
          </td>
          <td>
			<a href="#" onclick="listHandler(this);">
	          ${result[i].eventBoardTitle}
			</a>
          </td>
          <td>
            ${result[i].eventBoardViewCount}
          </td>
          <td>
            ${result[i].eventBoardDetailVO.eventBoardDetailDay}
          </td>
          <td>
            ${result[i].eventBoardStartday}
          </td>
          <td>
            ${result[i].eventBoardEndday}
          </td>
          <td>
            <a target="_blank" href="https://toosome.s3.ap-northeast-2.amazonaws.com/${result[i].eventBoardDetailVO.eventBoardDetailImageRoute}/${result[i].eventBoardDetailVO.eventBoardDetailImageName}.${result[i].eventBoardDetailVO.eventBoardDetailImageExtention}">상세보기</a>
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
const getList = (url, board, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url, //서버 요청 URI
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
	rows = 10000;
	getList(url, board, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainer.style.display = 'none';
});

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const id = e.parentNode.parentNode.children[0].innerText;
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/eventdetail/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			boardDetailId = res.eventBoardDetailVO.eventBoardDetailId;
			boardId = res.eventBoardId;
			$("#detail-id").val(res.eventBoardId);			
			$('input[name=eventBoardId]').val(res.eventBoardId);			
			$('input[name=eventBoardDetailId]').val(res.eventBoardDetailVO.eventBoardDetailId);			
			$("#detail-view").val(res.eventBoardViewCount);			
			$("#detail-reg").val(res.eventBoardDetailVO.eventBoardDetailDay);			
			$("#detail-start").val(res.eventBoardStartday);			
			$("#detail-end").val(res.eventBoardEndday);			
			$("#detail-title").val(res.eventBoardTitle);
			let imageURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/${res.eventBoardImageRoute}${res.eventBoardImageName}.${res.eventBoardImageExtention}`;			
			$("#detail-img").attr("src",imageURL);			
			let thumbnailURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/${res.eventBoardDetailVO.eventBoardDetailImageRoute}${res.eventBoardDetailVO.eventBoardDetailImageName}.${res.eventBoardDetailVO.eventBoardDetailImageExtention}`;			
			$("#detail-thumb").attr("src",thumbnailURL);			
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
	rows = +value;
	url = '/admin/eventboardmanagement';
	getList(url, board, listTable, rows);
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	url = '/admin/eventboardmanagement';
	getList(url, board, listTable, rows); 
}); 

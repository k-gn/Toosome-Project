const searchType = document.querySelector('#searchType'); // 검색어 선택
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
const lists = document.querySelectorAll('#list-table tbody tr'); // 리스트
const boardContainer = document.querySelector('#board-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼

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
	const newDate = moment(today).subtract(num, unit).format('MM/DD/YYYY');
	calendar.value = newDate;
};

// init
const calendarInit = () => {
	removeOn(eventPeriods);
	const today = moment().format('MM/DD/YYYY');
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
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	eventDate.options[0].selected = 'true';
	eventDatePeriod.style.display = 'none';
	calendarInit();
};

resetBtn.addEventListener('click', resetHandler);

/*// AJAX 전체 리스트 불러오기
const getAllList = () => {
	// AJAX 요청
	$.ajax({
		type: "POST", //서버에 전송하는 HTTP요청 방식
		url: "/member-list", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 리스트 생성 후 삽입
			const listTable = document.querySelector('#list-table-thead');
			listTable.innerHTML = '';
			result.forEach(res => {
				let newEl = document.createElement('tr');
				let content = `
					<tr>
                      <td>
                        ${res.memberId}
                      </td>
                      <td>
                        ${res.platFormType}
                      </td>
                      <td>
                        ${res.memberEmail}
                      </td>
                      <td>
                        ${res.memberName}
                      </td>
                      <td>
                        ${res.memberPhone}
                      </td>
                      <td>
                        ${res.regDate}
                      </td>
                      <td>
                        ${res.lastLoginDate}
                      </td>
                    </tr>			
				`;
				newEl.innerHTML = content;
				listTable.appendChild(newEl);
			});		
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};*/

// AJAX 검색 리스트 불러오기
const getList = (data) => {
	// AJAX 요청
	$.ajax({
		type: "POST", //서버에 전송하는 HTTP요청 방식
		url: "/member-search", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		data: JSON.stringify(data), //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 리스트 생성 후 삽입
			const listTable = document.querySelector('#list-table-thead');
			listTable.innerHTML = '';
			result.forEach(res => {
				let newEl = document.createElement('tr');
				let content = `
					<tr>
                      <td>
                        ${res.eventBoardId}
                      </td>
                      <td>
                        ${res.eventBoardTitle}
                      </td>
                      <td>
                        ${res.eventBoardContent}
                      </td>
                      <td>
                        ${res.eventBoardViewCount}
                      </td>
                      <td>
                        ${res.eventBoardStartday}
                      </td>
                      <td>
                        ${res.eventBoardEndday}
                      </td>
                      <td>
                        <a href="${res.eventBoardImageRoute}/${res.eventBoardImageName}.${res.eventBoardImageExtention}">상세보기</a>
                      </td>
                    </tr>			
				`;
				newEl.innerHTML = content;
				listTable.appendChild(newEl);
			});		
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	const eventTitle = ''; // 검색 이름
	const eventContent = ''; // 검색 이메일
	const startEventDate = ''; // 회원가입 검색 시작일
	const endEventDate = ''; // 회원가입 검색 종료일
	
	// 검색 이름 & 검색 이메일
	if(searchType.options[searchType.selectedIndex].value === 'title') { // 제목으로 검색시
		if(searchInput.value !== '') {
			eventTitle = searchInput.value;	
		}
	} else if(searchType.options[searchType.selectedIndex].value === 'content') { // 내용으로 검색시
		if(searchInput.value !== '') {
			eventContent = searchInput.value;			
		}
	};
	
	// 가입일자
	if(eventDate.options[eventDate.selectedIndex].value === 'use') {
		startEventDate = moment(eventCalendar.value).format('YYYY-MM-DD');
		endEventDate = moment(eventCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	const data = {
		eventTitle,
		eventContent,
		startEventDate,
		endEventDate,
	};
	
	getList(data);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tr = e.target.parentNode;
	const tds = tr.children;
	const index = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	
	boardContainerContainer.style.display = 'block';
	
};

// loop 돌며 list에 event hook
lists.forEach(list => {
	list.addEventListener('click', listHandler);
});

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainerContainer.style.display = 'none';
});

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
/*	getAllList();*/
	
	$('#datetimepicker1').datetimepicker({ format: 'L'});
	$('#datetimepicker2').datetimepicker({ 
		format: 'L',
		useCurrent: false
	});
	$("#datetimepicker1").on("change.datetimepicker", function (e) {
		$('#datetimepicker2').datetimepicker('minDate', e.date);
	});
	$("#datetimepicker2").on("change.datetimepicker", function (e) {
		$('#datetimepicker1').datetimepicker('maxDate', e.date);
	});
	
	$('#datetimepicker3').datetimepicker({ format: 'L'});
	$('#datetimepicker4').datetimepicker({ 
		format: 'L',
		useCurrent: false
	});
	$("#datetimepicker3").on("change.datetimepicker", function (e) {
		$('#datetimepicker4').datetimepicker('minDate', e.date);
	});
	$("#datetimepicker4").on("change.datetimepicker", function (e) {
		$('#datetimepicker3').datetimepicker('maxDate', e.date);
	});  
}); 

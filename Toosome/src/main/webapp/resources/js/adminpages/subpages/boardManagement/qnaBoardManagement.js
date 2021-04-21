const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const qnaDate = document.querySelector('#qnaDate'); // 작성일 기간선택
const qnaDatePeriod = document.querySelector('#qnaDatePeriod'); // 작성일 기간선택 버튼박스
const qnaPeriods = document.querySelectorAll('.period.qna'); // 작성일 기간 버튼들
const qnaCalendar = document.querySelector('#calendar1'); // 작성일 달력1
const qnaCalendar2 = document.querySelector('#calendar2'); // 작성일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const boardContainer = document.querySelector('#board-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'use') {
		qnaDatePeriod.style.display = 'inline';
	} else {
		qnaDatePeriod.style.display = 'none';
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
	removeOn(qnaPeriods);
	const today = moment().format('MM/DD/YYYY');
	qnaCalendar.value = today;
	qnaCalendar2.value = today;
};

// 기간 버튼 event hook
qnaPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(qnaPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, qnaCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	qnaDate.options[0].selected = 'true';
	qnaDatePeriod.style.display = 'none';
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
                        ${res.qnaBoardId}
                      </td>
                      <td>
                        ${res.qnaBoardType}
                      </td>
                      <td onclick="listHandler(this);">
                        <a href="#">${res.qnaBoardTitle}</a>
                      </td>
                      <td>
                        ${res.qnaBoardContent}
                      </td>
					  <td>
                        ${res.qnaBoardRegdate}
                      </td>
					  <td class="td-actions">
		                <button type="button" rel="tooltip" class="btn btn-info" data-toggle="modal" data-target="#commentListModal">댓글보기</button>
                      	<button type="button" rel="tooltip" class="btn btn-success" data-toggle="modal" data-target="#commentModal">댓글등록</button>
		                <button type="button" rel="tooltip" class="btn btn-danger">댓글삭제</button>
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
	const qnaBoardTitle = ''; // 검색 제목
	const qnaBoardContent = ''; // 검색 내용
	const qnaBoardWriter = ''; // 검색 작성자
	const startQnaDate = ''; // 검색 시작일
	const endQnaDate = ''; // 검색 종료일
	
	// 검색어
	if(searchInput.value !== '') {
		if(searchType.options[searchType.selectedIndex].value === 'title') { // 제목으로 검색시
			qnaBoardTitle = searchInput.value;	
		} else if(searchType.options[searchType.selectedIndex].value === 'content') { // 내용으로 검색시
			qnaBoardContent = searchInput.value;			
		} else { // 작성자로 검색시
			qnaBoardWriter = searchInput.value;
		};
	};
	
	// 가입일자
	if(eventDate.options[eventDate.selectedIndex].value === 'use') {
		startQnaDate = moment(newsCalendar.value).format('YYYY-MM-DD');
		endQnaDate = moment(newsCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	const data = {
		qnaBoardTitle,
		qnaBoardContent,
		qnaBoardWriter,
		startQnaDate,
		endQnaDate,
	};
	
	getList(data);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = () => {
/*	const tr = e.target.parentNode;
	const tds = tr.children;
	const index = tds[0].innerText;*/
	
	/* index로 AJAX 요청 */
	
	boardContainer.style.display = 'block';
	
};

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainer.style.display = 'none';
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
}); 

const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const sleepDate = document.querySelector('#sleepDate'); // 휴면전환일 기간선택
const sleepDatePeriod = document.querySelector('#sleepDatePeriod'); // 휴면전환일 기간선택 버튼박스
const sleepPeriods = document.querySelectorAll('.period.sleep'); // 휴면전환일 기간 버튼들
const sleepCalendar = document.querySelector('#calendar1'); // 휴면전환일 달력1
const sleepCalendar2 = document.querySelector('#calendar2'); // 휴면전환일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const profileContainer = document.querySelector('#profile-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블

let condition = ''; // 검색 이름
let keyword = ''; // 검색 이메일
let startSleepDate = ''; // 회원가입 검색 시작일
let endSleepDate = ''; // 회원가입 검색 종료일
let rows = 10000; // 한 페이지에 보여줄 게시글 수
const status = 2;
let member = {status}; 

// 기간선택 handler
const sleepChangeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'sleep-use') {
		sleepDatePeriod.style.display = 'inline';
	} else {
		sleepDatePeriod.style.display = 'none';
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
	removeOn(sleepPeriods);
	const today = moment().format('YYYY-MM-DD');
	sleepCalendar.value = today;
	sleepCalendar2.value = today;
};

// 기간 버튼 event hook
sleepPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(sleepPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, sleepCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	sleepDate.options[0].selected = 'true';
	sleepDatePeriod.style.display = 'none';
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
		if(result[i].lastLoginDate == null) {
			result[i].lastLoginDate = '';
		};
		let newEl = document.createElement('tr');
		newEl.setAttribute( 'onclick', 'listHandler(this)' );
		let content = `
          <td>
            ${result[i].memberId}
          </td>
          <td>
            ${result[i].platFormType}
          </td>
          <td>
            ${result[i].memberEmail}
          </td>
          <td>
            ${result[i].memberName}
          </td>
          <td>
            ${result[i].memberPhone}
          </td>
          <td>
            ${result[i].regDate}
          </td>
          <td>
            ${result[i].memberStatusDate}
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
const getList = (member, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/memberList", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: member, //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 검색 건수 출력
			let count = `검색 결과 : ${result.length}건`
			searchResult.innerText = count;
			// 데이터 출력 및 페이징
			setData(result, wrapper, rows);
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {

	condition = ''; // 검색 이름
	keyword = ''; // 검색 이메일
	startSleepDate = ''; // 회원가입 검색 시작일
	endSleepDate = ''; // 회원가입 검색 종료일

	// 검색 이름 & 검색 이메일
	if(searchType.options[searchType.selectedIndex].value === 'id') { // 아이디로 검색시
		if(searchInput.value !== '') {
			condition = searchType.options[searchType.selectedIndex].value;
			keyword = searchInput.value;	
		}
	} else if(searchType.options[searchType.selectedIndex].value === 'name') { // 이름으로 검색시
		if(searchInput.value !== '') {
			condition = searchType.options[searchType.selectedIndex].value;
			keyword = searchInput.value;			
		}
	};
	
	// 가입일자
	if(sleepDate.options[sleepDate.selectedIndex].value === 'sleep-use') {
		startSleepDate = moment(sleepCalendar.value).format('YYYY-MM-DD');
		endSleepDate = moment(sleepCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	const member = {
		condition,
		keyword,
		startSleepDate,
		endSleepDate,
		status
	};
	rows = 10000;
	getList(member);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/member/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
		
			if(res.memberBirth == null) {
				res.memberBirth = 'No Birth';
			}
			
			if(res.lastLoginDate == null) {
				res.lastLoginDate = 'No Log';
			}
		
			$("input[name=memberEmail]").val(res.memberEmail);			
			$("input[name=memberName]").val(res.memberName);			
			$("input[name=memberPhone]").val(res.memberPhone);			
			$("input[name=regDate]").val(res.regDate);			
			$("input[name=lastLoginDate]").val(res.lastLoginDate);			
			$("input[name=memberAddress]").val(res.memberAddress);			
			$("input[name=memberPostcode]").val(res.memberPostcode);			
			$("input[name=memberBirth]").val(res.memberBirth);			
			$("input[name=platFormType]").val(res.platFormType);			
			$("input[name=memberId]").val(res.memberId);			
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	
	profileContainer.style.display = 'block';
	$("input[name=memberName]").focus();
};

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	profileContainer.style.display = 'none';
})

// 엑셀 다운로드
const excelDownload = (id, title) => {
	let content = `
		<html xmlns:x="urns:schemas-microsoft-com:office:excel">
			<head>
				<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">
				<xml>
					<x:ExcelWorkbook>
						<x:ExcelWorksheets>
							<x:ExcelWorksheet>
								<x:Name>Sheet</x:Name>
									<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>
							</x:ExcelWorksheet>
						</x:ExcelWorksheets>
					</x:ExcelWorkbook>
				</xml>
			</head>
			<body>
				<table border="1px">
	`;
	const exportTable = $('#' + id).clone();
	exportTable.find('input').each((index, elem) => {
		$(elem).remove();
	});
	content += exportTable.html();
	content += `
		</table></body></html>
	`;
	const data_type = 'data:application/vnd.ms-excel';
	const ua = window.navigator.userAgent;
	const msie = ua.indexOf('MSIE');
	const fileName = title + '.xls';
	
	// IE 환경에서 다운로드
	if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
		if(window.navigator.msSaveBlob) {
			const blob = new Blob([content], {
				type: "application/csv;charset=UTF-8"
			});
			navigator.msSaveBlob(blob, fileName);
		}
	} else {
		const blob2 = new Blob([content], {
			type: "application/csv;charset=UTF-8"
		});
		const filename = fileName;
		const elem = window.document.createElement('a');
		elem.href = window.URL.createObjectURL(blob2);
		elem.download = filename;
		document.body.appendChild(elem);
		elem.click();
		document.body.removeChild(elem);
	}
};

// 정렬 select 핸들러
const selectHandler = (select) => {
	// selected value
	let value = select.options[select.selectedIndex].value;
	
	// init
	rows = +value;
	getList(member, listTable, rows);
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	getList(member, listTable, rows);
}); 

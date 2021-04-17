const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const recordDate = document.querySelector('#recordDate'); // 기간선택
const recordDatePeriod = document.querySelector('#recordDatePeriod'); // 간선택 버튼박스
const recordPeriods = document.querySelectorAll('.period.record'); // 기간 버튼들
const recordCalendar = document.querySelector('#calendar1'); // 달력1
const recordCalendar2 = document.querySelector('#calendar2'); // 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'record-use') {
		recordDatePeriod.style.display = 'inline';
	} else {
		recordDatePeriod.style.display = 'none';
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
	removeOn(recordPeriods);
	const today = moment().format('MM/DD/YYYY');
	recordCalendar.value = today;
	recordCalendar2.value = today;
};

// 기간 버튼 event hook
recordPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(recordPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, recordCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	recordDate.options[0].selected = 'true';
	recordDatePeriod.style.display = 'none';
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
                        ${res.memberName}
                      </td>
                      <td>
                        ${res.memberEmail}
                      </td>
                      <td>
                        ${res.connectDate}
                      </td>
                      <td>
                        ${res.connectMenu}
                      </td>
                      <td>
                        ${res.connectPage}
                      </td>
                      <td>
                        ${res.connectIP}
                      </td>
                      <td>
                        ${res.connectWork}
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
	const memberName = ''; // 검색 이름
	const memberEmail = ''; // 검색 이메일
	const startRecordDate = ''; // 회원가입 검색 시작일
	const endRecordDate = ''; // 회원가입 검색 종료일
	
	// 검색 이름 & 검색 이메일
	if(searchType.options[searchType.selectedIndex].value === 'id') { // 아이디로 검색시
		if(searchInput.value !== '') {
			memberName = searchInput.value;	
		}
	} else if(searchType.options[searchType.selectedIndex].value === 'name') { // 이름으로 검색시
		if(searchInput.value !== '') {
			memberEmail = searchInput.value;			
		}
	};
	
	// 가입일자
	if(recordDate.options[recordDate.selectedIndex].value === 'record-use') {
		startRecordDate = recordCalendar.value.moment('YYYY-MM-DD');
		endRecordDate = recordCalendar2.value.moment('YYYY-MM-DD');
	}
	
	// JSON Data
	const data = {
		memberName,
		memberEmail,
		startRecordDate,
		endRecordDate,
	};
	
	getList(data);
};

submitBtn.addEventListener('click', submitHandler);

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

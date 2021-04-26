const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const outDate = document.querySelector('#outDate'); // 탈퇴전환일 기간선택
const outDatePeriod = document.querySelector('#outDatePeriod'); // 탈퇴전환일 기간선택 버튼박스
const outPeriods = document.querySelectorAll('.period.out'); // 탈퇴전환일 기간 버튼들
const outCalendar = document.querySelector('#calendar1'); // 탈퇴전환일 달력1
const outCalendar2 = document.querySelector('#calendar2'); // 탈퇴전환일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const memberList = document.querySelectorAll('#member-table tbody tr'); // 회원 리스트
const profileContainer = document.querySelector('#profile-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼

let member = {};
let condition = '';
let keyword = '';
let startOutDate = ''; // 회원가입 검색 시작일
let endOutDate = ''; // 회원가입 검색 종료일

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'out-use') {
		outDatePeriod.style.display = 'inline';
	} else {
		outDatePeriod.style.display = 'none';
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
	removeOn(outPeriods);
	const today = moment().format('YYYY-MM-DD');
	outCalendar.value = today;
	outCalendar2.value = today;
};

// 기간 버튼 event hook
outPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(outPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, outCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	outDate.options[0].selected = 'true';
	outDatePeriod.style.display = 'none';
	calendarInit();
};

resetBtn.addEventListener('click', resetHandler);

// AJAX 검색 리스트 불러오기
const getList = (member) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/outList", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: member, //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 리스트 생성 후 삽입
			const listTable = document.querySelector('#list-table-tbody');
			listTable.innerHTML = '';
			let count = `검색 결과 : ${result.length}건`
			searchResult.innerText = count;
			result.forEach(res => {
				let newEl = document.createElement('tr');
				newEl.setAttribute( 'onclick', 'listHandler(this)' )
				let content = `
                  <td>
                    ${res.withdrawId}
                  </td>
                  <td>
                    ${res.platFormType}
                  </td>
                  <td>
                    ${res.withdrawEmail}
                  </td>
                  <td>
                    ${res.withdrawName}
                  </td>
                  <td>
                    ${res.withdrawPhone}
                  </td>
                  <td>
                    ${res.regDate}
                  </td>
                  <td>
                    ${res.withdrawDate}
                  </td>
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

 	condition = '';
 	keyword = '';
	startOutDate = ''; // 회원가입 검색 시작일
	endOutDate = ''; // 회원가입 검색 종료일
	
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
	if(outDate.options[outDate.selectedIndex].value === 'out-use') {
		startOutDate = moment(outCalendar.value).format('YYYY-MM-DD');
		endOutDate = moment(outCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	member = {
		condition,
		keyword,
		startOutDate,
		endOutDate
	};
	
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
		url: "/admin/out/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
		
			if(res.withdrawBirth == null) {
				res.withdrawBirth = 'No Birth';
			}
		
			$("input[name=withdrawEmail]").val(res.withdrawEmail);			
			$("input[name=withdrawName]").val(res.withdrawName);			
			$("input[name=withdrawPhone]").val(res.withdrawPhone);			
			$("input[name=regDate]").val(res.regDate);			
			$("input[name=withdrawDate]").val(res.withdrawDate);			
			$("input[name=withdrawAddress]").val(res.withdrawAddress);			
			$("input[name=withdrawPostcode]").val(res.withdrawPostcode);			
			$("input[name=withdrawBirth]").val(res.withdrawBirth);			
			$("input[name=platFormType]").val(res.platFormType);			
			$("input[name=withdrawId]").val(res.withdrawId);			
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	profileContainer.style.display = 'block';
	$("input[name=withdrawName]").focus();
};

// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	profileContainer.style.display = 'none';
});

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
	getList(member);
}); 

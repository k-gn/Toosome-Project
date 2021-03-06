const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const membershipGrade = document.querySelector('#membershipGrade'); // 멤버십 등급 선택
const membershipDate = document.querySelector('#membershipDate'); // 멤버십전환일 기간선택
const membershipDatePeriod = document.querySelector('#membershipDatePeriod'); // 멤버십전환일 기간선택 버튼박스
const membershipPeriods = document.querySelectorAll('.period.membership'); // 멤버십전환일 기간 버튼들
const membershipCalendar = document.querySelector('#calendar1'); // 멤버십전환일 달력1
const membershipCalendar2 = document.querySelector('#calendar2'); // 멤버십전환일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const memberList = document.querySelectorAll('#member-table tbody tr'); // 회원 리스트
const profileContainer = document.querySelector('#profile-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블

let condition = '';
let keyword = '';
let startDate = '';
let endDate = '';
let memberLevel = '';
let member = {}; 
let rows = 10000;

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'membership-use') {
		membershipDatePeriod.style.display = 'inline';
	} else {
		membershipDatePeriod.style.display = 'none';
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
	removeOn(membershipPeriods);
	const today = moment().format('YYYY-MM-DD');
	membershipCalendar.value = today;
	membershipCalendar2.value = today;
};

// 기간 버튼 event hook
membershipPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(membershipPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, membershipCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	membershipGrade.options[0].selected = 'true';
	membershipDate.options[0].selected = 'true';
	membershipDatePeriod.style.display = 'none';
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
		newEl.setAttribute( 'onclick', 'listHandler(this)');
		let content = `
          <td>
            ${result[i].membershipId}
          </td>
          <td>
            ${result[i].level.levelName}
          </td>
          <td>
            ${result[i].member.memberEmail}
          </td>
          <td>
            ${result[i].member.memberName}
          </td>
          <td>
            ${result[i].membershipPoint}
          </td>
          <td>
            ${result[i].membershipRegDate}
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

// AJAX 멤버십 등급 초기화
const initGrade = () => {
	$.ajax({
		type: "get",
		url: "/admin/level",
		success: (result) => {
			// loop를 돌며 select box의 level 재생성
			const level = document.querySelector('#lvl');
			const whole = document.createElement('option');
			whole.setAttribute('value', '');
			whole.innerText = '전체조회';
			membershipGrade.appendChild(whole);
			for (let i = 0; i < result.length; i++) {
				let newOption = document.createElement('option');
				newOption.setAttribute('value', result[i].levelId);
				newOption.innerText = result[i].levelName;
				membershipGrade.appendChild(newOption);
			};
			for (let i = 0; i < result.length; i++) {
				let newOption = document.createElement('option');
				newOption.setAttribute('value', result[i].levelId);
				newOption.innerText = result[i].levelName;
				level.appendChild(newOption);
			};
		},
		error: () => {
			alert('멤버십 등급 초기화 실패');
		}
	})
};

// AJAX 검색 리스트 불러오기
const getList = (member, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/membershipList", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: member, //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 검색 건수 출력
			let count = `검색 결과 : ${result.length}건`
			searchResult.innerText = count;
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
	condition = '';
    keyword = '';
	startDate = '';
	endDate = '';
	memberLevel = '';
	
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
	
	memberLevel = membershipGrade.options[membershipGrade.selectedIndex].value; // 멤버십 등급
	
	// 가입일자
	if(membershipDate.options[membershipDate.selectedIndex].value === 'membership-use') {
		startDate = moment(membershipCalendar.value).format('YYYY-MM-DD');
		endDate = moment(membershipCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	member = {
		condition,
		keyword,
		memberLevel,
		startDate,
		endDate
	};
	rows = 10000;
	getList(member, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/membershipMember/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			$("input[name=membershipId]").val(res.membershipId);			
			$("#lvl").val(res.levelId).prop("selected", true);			
			$("input[name=memberEmail]").val(res.member.memberEmail);			
			$("input[name=memberName]").val(res.member.memberName);			
			$("input[name=membershipPoint]").val(res.membershipPoint);			
			$("input[name=membershipRegDate]").val(res.membershipRegDate);			
			$("input[name=id]").val(res.membershipId);			
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
	initGrade();
	getList(member, listTable, rows); 	
}); 

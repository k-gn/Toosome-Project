const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const orderDate = document.querySelector('#orderDate'); // 주문일자 선택
const orderDatePeriod = document.querySelector('#orderDatePeriod'); // 주문일자 기간선택 버튼박스
const orderPeriods = document.querySelectorAll('.period.order'); // 주문일자 기간 버튼들
const orderCalendar = document.querySelector('#calendar1'); // 주문일자 달력1
const orderCalendar2 = document.querySelector('#calendar2'); // 주문일자 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const memberList = document.querySelectorAll('#member-table tbody tr'); // 회원 리스트
const profileContainer = document.querySelector('#profile-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'order-use') {
		orderDatePeriod.style.display = 'inline';
	} else {
		orderDatePeriod.style.display = 'none';
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
	removeOn(orderPeriods);
	const today = moment().format('YYYY-MM-DD');
	orderCalendar.value = today;
	orderCalendar2.value = today;
};

// 기간 버튼 event hook
orderPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(orderPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, orderCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	orderDate.options[0].selected = 'true';
	orderDatePeriod.style.display = 'none';
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
                        ${res.orderId}
                      </td>
                      <td>
                        ${res.orderState}
                      </td>
                      <td>
                        ${res.ordererId}
                      </td>
                      <td>
                        ${res.ordererName}
                      </td>
                      <td>
                        ${res.productVO.productName}
                      </td>
                      <td>
                        ${res.productVO.productCheckCount}
                      </td>
                      <td>
                        ${res.productVO.productPrice}
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
	let orderId = ''; // 주문 번호
	let productId = ''; // 상품 번호
	let productName = ''; // 상품명
	let ordererName = ''; // 주문자명
	let ordererPhone = ''; // 주문자 연락처
	let recipientName = ''; // 수령자명
	let recipientPhone = ''; // 수령자 연락처
	let startOrderDate = ''; // 회원가입 검색 시작일
	let endOrderDate = ''; // 회원가입 검색 종료일
	
	// 검색어 셀렉트 박스 타입
	if(searchInput.value !== '') {
		switch (searchType.options[searchType.selectedIndex].value) {
			case 'o-id' : orderId = searchInput.value; break;
			case 'p-id' : productId = searchInput.value; break;
			case 'p-name' : productName = searchInput.value; break;
			case 'o-name' : ordererName = searchInput.value; break;
			case 'o-phone' : ordererPhone = searchInput.value; break;
			case 'r-name' : recipientName = searchInput.value; break;
			case 'r-phone' : recipientPhone = searchInput.value; break;
		}
	}
	
	// 가입일자
	if(orderDate.options[orderDate.selectedIndex].value === 'order-use') {
		startOrderDate = moment(orderCalendar.value).format('YYYY-MM-DD');
		endOrderDate = moment(orderCalendar2.value).format('YYYY-MM-DD');
	}
	

	// JSON Data
	const data = {
		orderId,
		productId,
		productName,
		ordererName,
		ordererPhone,
		recipientName,
		recipientPhone,
		startOrderDate,
		endOrderDate
	};
	
	console.log(data);
	/*getList(data);*/
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tr = e.target.parentNode;
	const tds = tr.children;
	const index = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	
	profileContainer.style.display = 'block';
	
};

// loop 돌며 list에 event hook
memberList.forEach(list => {
	list.addEventListener('click', listHandler);
});

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

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
/*	getAllList();*/
	

}); 

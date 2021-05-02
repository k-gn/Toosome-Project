const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const categories = document.querySelector('#categories'); // 카테고리 선택
const isNew = document.querySelector('#isNew'); // 신,구메뉴 선택
const isState = document.querySelector('#state'); // 판매 상태 선택
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const profileContainer = document.querySelector('#profile-modal'); // 모달 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블

let condition = '';
let keyword = '';
let category = '';
let type = '';
let state = '';
let rows = 10000; // 한 페이지에 보여줄 게시글 수
let product = {}; 

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	categories.options[0].selected = 'true';
};

resetBtn.addEventListener('click', resetHandler);

// 메뉴 삭제 버튼
function delBtnFunc() {
	const formElement = document.formObj;
	let flag = confirm('정말로 삭제하시겠습니까?');
	let content = `/admin/delProduct?${parameterName}=${token}`;
	if(flag) {
		formElement.action = content;
		formElement.submit();
	}else {
		return;
	}
}

// 리스트 출력하기
const showList = (result, wrapper) => {
	console.log(result, wrapper);
	wrapper.innerHTML = ''; // 테이블 초기화
	let p_Type = ''; // 카테고리 초기화
	let p_State = ''; // 판매상태 초기화
	
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
		
		switch(result[i].productType){
			case '1': p_Type = '커피상품'; break;
			case '2': p_Type = '커피웨어/기타'; break;
			case '3': p_Type = '기프트세트'; break;
		};
		switch(result[i].productState){
			case 0: p_State = '판매중지'; break;
			case 1: p_State = '판매중'; break;
			case 2: p_State = '품절'; break;
			case 3: p_State = '단종'; break;
		};
		
		let newEl = document.createElement('tr');
		newEl.setAttribute( 'onclick', 'listHandler(this)' );
		let content = `
          <td>
            ${result[i].productId}
          </td>
          <td>
            ${p_Type}
          </td>
          <td>
            ${result[i].productTitleName}
          </td>
          <td>
            ${p_State}
          </td>
          <td>
            ${result[i].productCheckCount}
          </td>
          <td>
            ${result[i].productPrice}
          </td>
          <td>
            ${result[i].productregDate}
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
const getList = (product, wrapper, rows) => {
	console.log(product);
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/plist", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: product, //서버로 전송할 데이터
		success: (result) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log(result);
			// 리스트 생성 후 삽입
			let count = `검색 결과 : ${result.length}건`
			searchResult.innerText = count;	
			setData(result, wrapper, rows)
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	condition = '';
    keyword = '';
	category = '';
	type = '';
	state = '';
	
	// 상품 번호 & 상품 이름
	if(searchType.options[searchType.selectedIndex].value === 'id') { // 번호로 검색시
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
	
	category = categories.options[categories.selectedIndex].value; // 카테고리
	type = isNew.options[isNew.selectedIndex].value; 
	state = isState.options[isState.selectedIndex].value; 
	
	// JSON Data
	product = {
		condition,
		keyword,
		category,
		type,
		state
	};
	
	rows = 10000;
	getList(product, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/product/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: (res) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			
			if(res.productStartDay == null) {
				res.productStartDay = '';
			}
		
			$("input[name=id]").val(res.productId);			
			$("input[name=productId]").val(res.productId);			
			$("input[name=productPrice]").val(res.productPrice);			
			$("#modal-isNew").val(res.productNew).prop("selected", true);			
			$("#modal-categories").val(res.productType).prop("selected", true);			
			$("#modal-state").val(res.productState).prop("selected", true);			
			$("input[name=productMainTitle]").val(res.productTitleName);			
			$("input[name=productSubTitle]").val(res.productSubName);			
			$("input[name=productContent]").val(res.productContent);
			$("input[name=productCheckCount]").val(res.productCheckCount);
			$("input[name=productStartDate]").val(res.productStartDay);			
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	
	profileContainer.style.display = 'block';
	$("input[name=productPrice]").focus();
};

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
	getList(product, listTable, rows);
};

modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	profileContainer.style.display = 'none';
})

$(document).ready(() => {
	getList(product, listTable, rows);
}); 

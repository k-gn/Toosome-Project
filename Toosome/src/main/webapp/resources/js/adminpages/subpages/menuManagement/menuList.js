const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const categories = document.querySelector('#categories'); // 카테고리 선택
const isNew = document.querySelector('#isNew'); // 신,구메뉴 선택
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
let rows = 10000; // 한 페이지에 보여줄 게시글 수
let menu = {}; 

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	categories.options[0].selected = 'true';
};

resetBtn.addEventListener('click', resetHandler);

// 메뉴 삭제 버튼
function delBtnFunc() {
	const formElement = document.querySelector('#formObj');
	let flag = confirm('정말로 삭제하시겠습니까?');
	if(flag) {
		formElement.attr("action", "/admin/menu/del");
		formElement.attr("method", "post");		
		formElement.submit();
	}
}

// 리스트 출력하기
const showList = (result, wrapper) => {
	wrapper.innerHTML = ''; // 테이블 초기화
	let mtype = ''; // 카테고리 초기화
	let state = ''; // 판매상태 초기화
	
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
		
		switch(result[i].menuType){
			case '1': mtype = '커피&음료'; break;
			case '2': mtype = '디저트'; break;
			case '3': mtype = '델리'; break;
			case '4': mtype = '홀켘이크'; break;					
		};
		switch(result[i].menuState){
			case 1: state = '판매중'; break;
			case 2: state = '판매중지'; break;
			case 3: state = '단종'; break;
		};
		
		let newEl = document.createElement('tr');
		newEl.setAttribute( 'onclick', 'listHandler(this)' );
		let content = `
          <td>
            ${result[i].menuId}
          </td>
          <td>
            ${mtype}
          </td>
          <td>
            ${result[i].menuMainTitle}
          </td>
          <td>
            ${state}
          </td>
          <td>
            ${result[i].menuCheckCount}
          </td>
          <td>
            ${result[i].menuPrice}
          </td>
          <td>
            ${result[i].menuRegDate}
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
const getList = (menu, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/mlist", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: menu, //서버로 전송할 데이터
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
	
	// 메뉴 번호 & 메뉴 이름
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
	
	category = categories.options[categories.selectedIndex].value; // 카테고리
	type = isNew.options[isNew.selectedIndex].value; // 카테고리
	
	// JSON Data
	menu = {
		condition,
		keyword,
		category,
		type
	};
	
	rows = 10000;
	getList(menu, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/menu/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: (res) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			
			if(res.menuStartDate == null) {
				res.menuStartDate = '';
			}
		
			$("input[name=menuId]").val(res.menuId);			
			$("input[name=menuPrice]").val(res.menuPrice);			
			$("#modal-isNew").val(res.menuNew).prop("selected", true);			
			$("#modal-categories").val(res.menuType).prop("selected", true);			
			$("input[name=menuMainTitle]").val(res.menuMainTitle);			
			$("input[name=menuSubTitle]").val(res.menuSubTitle);			
			$("input[name=menuContent]").val(res.menuContent);
			$("input[name=menuCheckCount]").val(res.menuCheckCount);
			$("#modal-state").val(res.menuState).prop("selected", true);			
			$("input[name=menuRegDate]").val(res.menuRegDate);			
			$("input[name=menuStartDate]").val(res.menuStartDate);			
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	
	profileContainer.style.display = 'block';
	$("input[name=menuPrice]").focus();
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
	getList(menu, listTable, rows);
};

modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	profileContainer.style.display = 'none';
})

$(document).ready(() => {
	getList(menu, listTable, rows);
}); 
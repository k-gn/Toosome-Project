const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const categories = document.querySelector('#categories'); // 카테고리 선택
const isNew = document.querySelector('#isNew'); // 신,구메뉴 선택
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const profileContainer = document.querySelector('#profile-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼

let condition = '';
let keyword = '';
let category = '';
let type = '';
let menu = {}; 

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	categories.options[0].selected = 'true';
};

resetBtn.addEventListener('click', resetHandler);

// AJAX 검색 리스트 불러오기
const getList = (menu) => {
	console.log(menu);
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/mlist", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: menu, //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 리스트 생성 후 삽입
			console.log(result);
			const listTable = document.querySelector('#list-table-tbody');
			listTable.innerHTML = '';
			let count = `검색 결과 : ${result.length}건`
			searchResult.innerText = count;
			result.forEach(res => {
				let newEl = document.createElement('tr');
				newEl.setAttribute( 'onclick', 'listHandler(this)' );
				let content = `
                  <td>
                    ${res.menuId}
                  </td>
                  <td>
                    ${res.menuType}
                  </td>
                  <td>
                    ${res.menuMainTitle}
                  </td>
                  <td>
                    ${res.menuState}
                  </td>
                  <td>
                    ${res.menuCheckCount}
                  </td>
                  <td>
                    ${res.menuPrice}
                  </td>
                  <td>
                    ${res.menuRegDate}
                  </td>
				`;
				newEl.innerHTML = content;
				listTable.appendChild(newEl);
			});		
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
	
	getList(menu);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	
	/* index로 AJAX 요청 
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/menu/" + id, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log(res);
		}, 
		error: function() {
			alert('시스템과에 문의하세요');
		} 
	});*/
	
	profileContainer.style.display = 'block';
	$("input[name=menuName]").focus();
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

modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	profileContainer.style.display = 'none';
})

$(document).ready(() => {
	getList(menu);
}); 
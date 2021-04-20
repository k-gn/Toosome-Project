const pagination = document.getElementById('pagination');
const qnaBoard = document.getElementById('qna');
const searchBtn = document.getElementById('search-btn'); // 검색 버튼
const searchInput = document.getElementById('search-input'); // 검색 인풋창

let currentPage = 1; // 현재 페이지
let rows = 10; // 한 페이지에 보여줄 게시글 수

// 게시판 상세 페이지로 이동 함수
const locateQnaDetail = (index, isLocked) => {
	if(!isLocked) {
		// index를 갖고 상세 페이지로 이동
		window.location.href = '/qna-detail?index='+index;
	} else {
		let pwd = prompt('비밀번호를 입력해주세요');
		
		// 서버와 비밀번호 대조
		$.ajax({
			type: "POST",
			url: '/qna-detail?index='+index,
			data: {
				"qnaBoardPassword": pwd,
			},
			success: (res) => {
				console.log(res);
			},
			error: () => {
				alert('통신장애');
			}
		});
	};
};

// 리스트 출력
const displayList = (items, wrapper, rowsPerPage, page) => {
	wrapper.innerHTML = ""; // 테이블 초기화
	page--;
	
	// 검색 결과가 없을 경우
	if(items.length === 0) {
		let newItem = document.createElement('tr');
		let itemElement = `
			<td colspan="4">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
	}
	
	let start = rowsPerPage * page; // 시작 번호
	let end = start + rowsPerPage; // 끝 번호
	// 데이터를 rows만큼 끊어온다
	let paginatedItems = items.slice(start, end);
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < paginatedItems.length; i++) {
		let item = paginatedItems[i];
		// 문의 유형
		let type = '';
		switch(item.qnaBoardType) {
			case 1: type = '메뉴문의'; break;
			case 2: type = '상품문의'; break;
			case 3: type = '배송문의'; break;
			case 4: type = '창업문의'; break;
			case 5: type = '기타'; break;
		};
		// 날짜 변환
		let date = new Date(item.qnaBoardRegdate);
		let newDate = `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`;
		
		let newItem = document.createElement('tr');
		let itemElement = `
			<td>${item.qnaBoardId}</td>
			<td><img class="lock" src=${item.qnaBoardSecret ? "/resources/img/subpages/qna/lock.png" 
			: "/resources/img/subpages/qna/unlock.png"}></td>
			<td class="left"><a href="#" onclick="locateQnaDetail(${item.qnaBoardId},${item.qnaBoardSecret})">${item.qnaBoardTitle}</a></td>
			<td>${type}</td>
			<td>${newDate}</td>
			<td>${item.qnaBoardViewCount}</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
	};
};

// 페이지네이션 세팅
const setPagination = (items, wrapper, rowsPerPage) => {
	wrapper.innerHTML = ""; // 테이블 초기화
	
	// 총 페이징 숫자
	let pageCount = Math.ceil(items.length / rowsPerPage);
	for(let i = 1; i < pageCount + 1; i++) {
		let btn = paginationBtn(i, items);
		wrapper.appendChild(btn);
	};
};

// 페이지네이션 버튼 생성 후 반환
const paginationBtn = (page, items) => {
	let btn = document.createElement('button');
	btn.innerText = page;
	// 현재 페이지에서 active 활성화
	if(currentPage == page) {
		btn.classList.add('active');
	};
	
	btn.addEventListener('click', (e) => btnHandler(e,items,page));
	return btn;
};

// 페이지네이션 버튼 핸들러
const btnHandler = (e,items,page) => {
	// 현재 페이지 이동
	currentPage = page;
	// 누른 페이지 데이터 출력
	displayList(items, qnaBoard, rows, currentPage);
	// 이전 버튼 비활성화
	let currentBtn = document.querySelector('#pagination button.active');
	currentBtn.classList.remove('active');
	// 누른 버튼 활성화
	e.target.classList.add('active');
};

// AJAX 요청 함수
const getPage = (url) => {
	$.ajax({
		url,
		success: (res) => {
			const newRes = res.reverse();
			
			displayList(newRes, qnaBoard, rows, currentPage);
			setPagination(newRes, pagination, rows);			
		},
		error: () => {
			alert('통신장애');
		}
	});
};

// 검색 버튼 핸들러
const searchHandler = () => {
	// 유효성 검사
	if(searchInput.value === '') {
		alert('검색어를 입력하세요.');
		return;
	} else { // 검색어값 있을시
		let keyword = searchInput.value;
		url = '/qnasearch?keyword='+keyword;
		getPage(url);		
	}
};

// 검색 event hook
searchBtn.addEventListener('click', searchHandler);
searchInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
      searchHandler();
    }
});

// onload시 AJAX 요청
$(document).ready(() => {
	url = '/qnalist';
	getPage(url);
});

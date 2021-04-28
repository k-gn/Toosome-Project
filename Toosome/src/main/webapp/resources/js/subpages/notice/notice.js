const noticeBoard = document.getElementById('notice'); // 게시판
const searchBtn = document.getElementById('search-btn'); // 검색 버튼
const searchInput = document.getElementById('search-input'); // 검색 인풋창

let result = []; // AJAX 결과 복사할 빈 배열
let url = ''; // URL

// 게시판 상세 페이지로 이동 함수
const locateNoticeDetail = (index) => {
	// index를 갖고 상세 페이지로 이동
	window.location.href = '/notice-detail?index='+index;
}

// 리스트 출력
const displayList = (items, wrapper) => {
	wrapper.innerHTML = ""; // 테이블 초기화
	
	// 검색 결과가 없을 경우
	if(items.length === 0) {
		let newItem = document.createElement('tr');
		let itemElement = `
			<td colspan="4">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	}
	
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < items.length; i++) {
		// 날짜 변환
		let date = new Date(items[i].noticeBoardRegdate);
		let newDate = `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`;
		
		let newItem = document.createElement('tr');
		let itemElement = `
			<td>${items[i].noticeBoardId}</td>
			<td class="left"><a href="#" onclick="locateNoticeDetail(${items[i].noticeBoardId})">${items[i].noticeBoardTitle}</a></td>
			<td>${newDate}</td>
			<td>${items[i].noticeBoardViewCount}</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
	};
};

// 페이징 처리 후 데이터 출력
const setData = (result) => {
	$('#pagination').pagination({
	    dataSource: result,
	    pageSize: 10,
	    pageNumber: 5,
	    callback: function(data, pagination) {
			displayList(data, noticeBoard);					
	    }
	});
};

// AJAX 요청 함수
const getPage = (url) => {
	$.ajax({
		url,
		success: (res) => {
			result = [...res];
			setData(res);
		},
		error: () => {
			alert('통신장애');
			history.back();
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
		url = '/noticesearch?keyword='+keyword;
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

// 정렬 select 핸들러
const selectHandler = (select) => {
	// selected value
	let value = select.options[select.selectedIndex].value;
	
	// init
	let temp = [...result]; // 배열 복사
	let newRes = []; // 정렬된 배열을 담을 빈 배열
	
	switch(value) {
		case '0':
			setData(temp); 
			break;
		case '1': // 작성일순 정렬 
			newRes = temp.sort((a,b) => {
				a = new Date(a.noticeBoardRegdate);
				b = new Date(b.noticeBoardRegdate);
				return b - a;
			});
			setData(newRes);
			break;
		case '2': // 조회수순 정렬
			newRes = temp.sort((a,b) => {
				return b.noticeBoardViewCount - a.noticeBoardViewCount;
			});
			setData(newRes);
			break;
	};
};

// onload시 AJAX 요청
$(document).ready(() => {
	url = '/noticelist';
	getPage(url);
});


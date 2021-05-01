const qnaBoard = document.getElementById('qna');
const searchBtn = document.getElementById('search-btn'); // 검색 버튼
const searchInput = document.getElementById('search-input'); // 검색 인풋창

let result = []; // AJAX 결과 복사할 빈 배열
let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

// 게시판 상세 페이지로 이동 함수
const locateQnaDetail = (index, isLocked) => {
	let pwd = '';
	if(isLocked) {
		pwd = prompt('비밀번호를 입력해주세요');
	} 
	const vo = {
		qnaBoardPassword : pwd,
		qnaBoardId : index,
		qnaBoardSecret: isLocked
	};
	
	$(document).ajaxSend(function(e, xhr, options) { 
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
    }); 
	
	// 서버와 비밀번호 대조
	$.ajax({
		type: "POST",
		url: '/qna-detail',
		headers: {
			"Content-Type": "application/json",
		},
		dataType: "text", 
		data: JSON.stringify(vo),
		success: (res) => {
			if(res === 'success') {
				location.href='/qna-detail?index='+index;
			} else {
				alert('비밀번호가 일치하지 않습니다.');
				return;
			}
		},
		error: () => {
			alert('통신장애');
		}
	});
};

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
		// 문의 유형
		let type = '';
		switch(items[i].qnaBoardType) {
			case 1: type = '메뉴문의'; break;
			case 2: type = '상품문의'; break;
			case 3: type = '배송문의'; break;
			case 4: type = '창업문의'; break;
			case 5: type = '기타'; break;
		};
		// 날짜 변환
		let date = new Date(items[i].qnaBoardRegdate);
		let newDate = `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`;
		
		let newItem = document.createElement('tr');
		let itemElement = `
			<td>${items[i].qnaBoardId}</td>
			<td><img class="lock" src=${items[i].qnaBoardSecret ? "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/qna/lock.png" 
			: "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/qna/unlock.png"}></td>
			<td class="left"><a href="#" onclick="locateQnaDetail(${items[i].qnaBoardId},${items[i].qnaBoardSecret})">${items[i].qnaBoardTitle}</a></td>
			<td>${type}</td>
			<td>${newDate}</td>
			<td>${items[i].qnaBoardViewCount}</td>
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
	    pageNumber: 1,
	    callback: function(data, pagination) {
			displayList(data, qnaBoard);					
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
				a = new Date(a.qnaBoardRegdate);
				b = new Date(b.qnaBoardRegdate);
				return b - a;
			});
			setData(newRes);
			break;
		case '2': // 조회수순 정렬
			newRes = temp.sort((a,b) => {
				return b.qnaBoardViewCount - a.qnaBoardViewCount;
			});
			setData(newRes);
			break;
	};
};

// onload시 AJAX 요청
$(document).ready(() => {
	url = '/qnalist';
	getPage(url);
});

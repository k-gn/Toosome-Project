const faqContainer = document.querySelector('.faq-container'); // FAQ 컨테이너
const searchBtn = document.getElementById('search-btn'); // 검색 버튼
const searchInput = document.getElementById('search-input'); // 검색 인풋창

// 아코디언 핸들러 함수
const accordionHandler = (q) => {
	const parent = q.parentNode;
	parent.classList.toggle('active');
}

// 리스트 출력
const displayList = (items, wrapper) => {
	wrapper.innerHTML = ""; // 테이블 초기화
	
	// 검색 결과가 없을 경우
	if(items.length === 0) {
		let newItem = document.createElement('div');
		newItem.classList.add('faq-wrapper');
		let itemElement = `
			<div class="faq-question">
				<div><span>검색 결과가 없습니다.</span></div>
			</div>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	}
	
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < items.length; i++) {
		let newItem = document.createElement('div');
		newItem.classList.add('faq-wrapper');
		let itemElement = `
			<div class="faq-question" onclick="accordionHandler(this);">
				<div>
					<span>Q</span> <span>${items[i].faqBoardTitle}</span>
				</div>
				<button class="accordion">
					<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/down.png" alt="#">
				</button>
			</div>
			<div class="faq-answer">
				<div>
					<span>A</span> <span>${items[i].faqBoardContent}</span>
				</div>
			</div>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
	};
};

// AJAX 요청 함수
const getPage = (url) => {
	$.ajax({
		url,
		success: (res) => {
			const newRes = res.reverse();		
			displayList(newRes, faqContainer);
		},
		error: () => {
			alert('통신장애');
			window.history.back();
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
		url = '/faqsearch?keyword='+keyword;
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
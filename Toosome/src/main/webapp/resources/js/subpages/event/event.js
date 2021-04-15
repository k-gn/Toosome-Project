const tabs = document.querySelectorAll('[data-tab-target]'); // 탭
const content = document.querySelector('#content'); // 콘텐츠
const moreBtn = document.querySelector('.load-more'); // 더보기 버튼

let currentItems = 6; // 화면에 출력할 게시물 수
let url = ''; // 요청 URL

// 데이터 받아서 처음에 보여줄 element 생성
const getElements = (data, number) => {
	let results = [];
	if(data.length >= number) {
		results = data.slice(number-6,number).map((result) => {
			const li = document.createElement('li');
			li.innerHTML = `
				<a href="/event-detail?type=${type}&index=${result.id}">
					<img src=${result.img} alt="#">
					<p>${result.title}</p>
					<p>${result.period}</p>														
				</a>
			`;
			return li;
		});
		return results;	
	} else {
		results = data.slice(number-6).map((result) => {
			const li = document.createElement('li');
			li.innerHTML = `
				<a href="/event-detail?type=${type}&index=${result.id}">
					<img src=${result.img} alt="#">
					<p>${result.title}</p>
					<p>${result.period}</p>														
				</a>
			`;
			return li;
		});
		return results;	
	}
}

// 탭 핸들러 함수
const tabHandler = () => {
	currentItems = 6;
	// 눌려진 탭의 element를 가져온다
	const target = document.querySelector(tab.dataset.tabTarget);
	const targetUl = target.firstElementChild;
	// 자식 노드 초기화
	while(targetUl.hasChildNodes()) {
		targetUl.removeChild(targetUl.firstElementChild);
	}
	
	let elements = [];
	// 진행중, 매장별, 종료된 이벤트 구분
	switch(tab.dataset.tabTarget) {
		case '#ing':
			currentItems = 6;
			elements = getElements('ing', ingTestData, currentItems);
			showMoreBtn(moreBtns[0], ingTestData, currentItems);
			break;
		case '#store':
			storeItems = 6;
			elements = getElements('store', storeTestData, storeItems);
			showMoreBtn(moreBtns[1], storeTestData, storeItems);
			break;
		case '#end':
			endItems = 6;
			elements = getElements('end', endTestData, endItems);
			showMoreBtn(moreBtns[2], endTestData, endItems);
			break;
	};
	// 처음 보여줄 element 생성 후 삽입
	elements.forEach(element => {
		targetUl.appendChild(element);			
	});
	// 콘텐츠 초기화
	contents.forEach(content => {
		content.classList.remove('active');
	});
	// 탭 초기화
	tabs.forEach(tab => {
		tab.classList.remove('active');
	});
	// 해당 요소 화면 출력
	target.classList.add('active');	
	// 해당 탭 화면 출력
	tab.classList.add('active');
};

// 더보기 핸들러
const loadMore = () => {
	// 눌려진 탭의 element를 가져온다
	const target = document.querySelector(tab);
	const targetUl = target.firstElementChild;
	let newElements = [];
	switch(tab) {
		case '#ing':
			currentItems += 6;
			newElements = getElements('ing', ingTestData, currentItems);
			showMoreBtn(moreBtns[0], ingTestData, currentItems);
			break;
		case '#store':
			storeItems += 6;
			newElements = getElements('store', storeTestData, storeItems);
			showMoreBtn(moreBtns[1], storeTestData, storeItems);
			break;
		case '#end':
			endItems += 6;
			newElements = getElements('end', endTestData, endItems);
			showMoreBtn(moreBtns[2], endTestData, endItems);
			break;
	}
	// 다음 컨텐츠 출력
	newElements.forEach(element => {
		targetUl.appendChild(element);			
	});
};

// event hook
tabs.forEach(tab => {
	tab.addEventListener('click', () => tabHandler(tab));
});

moreBtn.addEventListener('click', loadMore);

// AJAX 요청 함수
const getData = (type, url) => {
	$.ajax({
		url,
		success: (res) => {
			const newRes = res.reverse();
			const elements = getElements(newRes, currentItems);
			elements.forEach(element => {
				content.appendChild(element);			
			});		
		}
	});
};

// document 준비시 실행
$(document).ready(() => {
	url = '/eventlist?type=ing'
	getData('ing', url);
});

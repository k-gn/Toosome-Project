const tabs = document.querySelectorAll('[data-tab-target]'); // 탭
const contents = document.querySelectorAll('[data-tab-content]'); // 콘텐츠
const moreBtns = document.querySelectorAll('.load-more'); // 더보기 버튼

let currentItems = 6; // 화면에 출력할 게시물 수
let storeItems = 6;
let endItems = 6;

// test data
const ingOriginData = [
	{id: 1, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 2, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 3, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 4, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 5, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e03.jpg"},
	{id: 6, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 7, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 8, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 9, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 10, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 11, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 12, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e03.jpg"},
	{id: 13, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 14, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 15, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
];

const ingTestData = [...ingOriginData].reverse();

const storeOriginData = [
	{id: 1, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 2, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 3, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 4, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 5, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e03.jpg"},
	{id: 6, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e03.jpg"},
	{id: 7, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 8, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 9, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 10, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 11, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 12, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e03.jpg"},
];

const storeTestData = [...storeOriginData].reverse();

const endOriginData = [
	{id: 1, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e03.jpg"},
	{id: 2, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e02.jpg"},
	{id: 3, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e01.jpg"},
	{id: 4, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
	{id: 5, title: "투썸플레이스X무직타이거 프로모션", period: "2021.03.20~2021.03.30", img: "/resources/img/subpages/event/e04.jpg"},
];

const endTestData = [...endOriginData].reverse();

window.onload = () => {
	currentItems = 6;
	const ingUl = document.querySelector('#ing .ing-content');
	const elements = getElements(ingTestData, currentItems);
	elements.forEach(element => {
		ingUl.appendChild(element);			
	});
	showMoreBtn(moreBtns[0], ingData, currentItems);
};

// 데이터 받아서 처음에 보여줄 element 생성
const getElements = (data, number) => {
	let results = [];
	if(data.length >= number) {
		results = data.slice(number-6,number).map((result) => {
			const li = document.createElement('li');
			li.innerHTML = `
				<a href="#">
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
				<a href="#">
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
const tabHandler = (tab) => {
	/*
	서버 연결
	// 파라미터 JSON 형태로 받기
	const getParameterByJson = () => {
		const url = document.location.href;
		const qs = url.substring(url.indexOf('?') + 1).split('&');
		const result = {};
		for(let i=0; i<qs.length; i++) {
			qs[i] = qs[i].split('=');
			result[qs[i][0]] = decodeURIComponent(qs[i][1]);
		}
		return result;
	}
	 */
	
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
			elements = getElements(ingTestData, currentItems);
			showMoreBtn(moreBtns[0], ingTestData, currentItems);
			break;
		case '#store':
			storeItems = 6;
			elements = getElements(storeTestData, storeItems);
			showMoreBtn(moreBtns[1], storeTestData, storeItems);
			break;
		case '#end':
			endItems = 6;
			elements = getElements(endTestData, endItems);
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

// 더보기 버튼 show 함수
const showMoreBtn = (btn, data, number) => {
	// 데이터 길이가 6 초과면 버튼 보이기
	if(data.length > number) {
		btn.style.display = 'block';
	} else {
		btn.style.display = 'none';
	}
}

// 더보기 핸들러
const loadMore = (tab) => {
	// 눌려진 탭의 element를 가져온다
	const target = document.querySelector(tab);
	const targetUl = target.firstElementChild;
	let newElements = [];
	switch(tab) {
		case '#ing':
			currentItems += 6;
			newElements = getElements(ingTestData, currentItems);
			showMoreBtn(moreBtns[0], ingTestData, currentItems);
			break;
		case '#store':
			storeItems += 6;
			newElements = getElements(storeTestData, storeItems);
			showMoreBtn(moreBtns[1], storeTestData, storeItems);
			break;
		case '#end':
			endItems += 6;
			newElements = getElements(endTestData, endItems);
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
moreBtns[0].addEventListener('click', () => loadMore('#ing'));
moreBtns[1].addEventListener('click', () => loadMore('#store'));
moreBtns[2].addEventListener('click', () => loadMore('#end'));

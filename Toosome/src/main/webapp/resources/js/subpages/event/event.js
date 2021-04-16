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
			// 날짜 변환
			let startDate = new Date(result.eventBoardStartday);
			let newStartDate = `${startDate.getFullYear()}-${startDate.getMonth()}-${startDate.getDay()}`;
			let endDate = new Date(result.eventBoardEndday);
			let newEndDate = `${endDate.getFullYear()}-${endDate.getMonth()}-${endDate.getDay()}`;
			
			const li = document.createElement('li');
			li.innerHTML = `
				<a href="/event-detail?index=${result.eventBoardId}">
					<img src="${result.eventBoardImageRoute}${result.eventBoardImageName}.${result.eventBoardImageExtention}" alt="#">
					<p>${result.eventBoardTitle}</p>
					<p>${newStartDate}~${newEndDate}</p>														
				</a>
			`;
			return li;
		});
		return results;	
	} else {
		// 더 보기 버튼 비활성화
		moreBtn.style.display = 'none';
		results = data.slice(number-6).map((result) => {
			// 날짜 변환
			let startDate = new Date(result.eventBoardStartday);
			let newStartDate = `${startDate.getFullYear()}-${startDate.getMonth()}-${startDate.getDay()}`;
			let endDate = new Date(result.eventBoardEndday);
			let newEndDate = `${endDate.getFullYear()}-${endDate.getMonth()}-${endDate.getDay()}`;
			
			const li = document.createElement('li');
			li.innerHTML = `
				<a href="/event-detail?index=${result.eventBoardId}">
					<img src="${result.eventBoardImageRoute}${result.eventBoardImageName}.${result.eventBoardImageExtention}" alt="#">
					<p>${result.eventBoardTitle}</p>
					<p>${newStartDate}~${newEndDate}</p>														
				</a>
			`;
			return li;
		});
		return results;	
	}
};

// 탭 핸들러 함수
const tabHandler = (tab) => {
	content.innerHTML = '';
	currentItems = 6;
	
	// 탭 초기화
	tabs.forEach(tab => {
		tab.classList.remove('active');
	});

	// 해당 탭 화면 출력
	tab.classList.add('active');
	
	// 진행중, 종료된 이벤트 구분 후 AJAX 요청
	switch(tab.dataset.tabTarget) {
		case 'ing':
			url = '/eventlist';
			getData(url, currentItems);
			break;
		case 'end':
			url = '/end-eventlist';
			getData(url, currentItems);
			break;
	};
};

// 더보기 핸들러
const loadMore = (tab) => {
	
	// 어느 탭에서 버튼을 눌렀는지 판별
	let target = '';
	if(tab.classList.contains('active')) {
		target = tab.dataset.tabTarget;		
	};
	
	switch(target) {
		case 'ing':
			currentItems += 6;
			url = '/eventlist';
			getData(url, currentItems);
			break;
		case 'end':
			currentItems += 6;
			url = '/end-eventlist';
			getData(url, currentItems);
			break;
	};
};

// event hook
tabs.forEach(tab => {
	tab.addEventListener('click', () => tabHandler(tab));
	moreBtn.addEventListener('click', () => loadMore(tab));
});


// AJAX 요청 함수
const getData = (url, number) => {
	$.ajax({
		url,
		success: (res) => {
			console.log(res);
			const newRes = res.reverse();
			const elements = getElements(newRes, number);
			elements.forEach(element => {
				content.appendChild(element);			
			});		
		},
		error: () => {
			alert('통신장애');
		}
	});
};

// document 준비시 실행
$(document).ready(() => {
	url = '/eventlist';
	getData(url);
});

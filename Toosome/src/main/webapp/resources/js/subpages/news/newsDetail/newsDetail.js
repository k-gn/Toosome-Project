const detailTitle = document.querySelector('.news-table thead'); // 뉴스 세부 타이틀
const detailContent = document.querySelector('#newsDetail'); // 뉴스 세부 본문
const prev = document.querySelector('.prev'); // 이전글
const next = document.querySelector('.next'); // 다음글

// 테스트 데이터
const testData = [
	{
		id: null, 
		title: null, 
		date: null, 
		content: null
	},
	{
		id: 18, 
		title: "이벤트2", 
		date: "2020-03-25", 
		content: "/resources/img/subpages/news/newsDetail/e002.jpg"
	},
	{
		id: 17, 
		title: "이벤트1", 
		date: "2020-03-25", 
		content: "/resources/img/subpages/news/newsDetail/e001.png"
	}
];

// parameter 받아오는 함수
const getParam = (param) => {
	let url = location.href;
	let params = (url.slice(url.indexOf('?') + 1)).split('=');
	let [variable, value] = params;	
	if(variable.toUpperCase() === param.toUpperCase()) {
		return value;
	} else {
		/* error code 작성 */
		alert('경고\n올바른 요청이 아닙니다.');
	}
}

// 리스트 출력
const displayDetail = (title, content, items, index) => {
	title.innerHTML = ""; // 타이틀 초기화
	content.innerHTML = ""; // 본문 초기화
	
	if(items[1].id === +index) {
		// 받은 데이터로 새 타이틀 생성 후 삽입
		let newTitle = document.createElement('tr');
		let titleElement = `
			<th colspan="3">${items[1].title}</th>
			<th colspan="1">${items[1].date}</th>
		`;
		newTitle.innerHTML = titleElement;
		title.appendChild(newTitle);
		
		// 받은 데이터로 새 본문 생성 후 삽입
		let newContent = document.createElement('tr');
		let contentElement = `
			<td colspan="4"><img src="${items[1].content}"></td>
		`;
		newContent.innerHTML = contentElement;
		content.appendChild(newContent);
		
		displayLocator(items, index);
	} else {
		alert('잘못된 요청입니다');
		window.history.go(-1);
	}
};

// 이전글, 다음글 생성 함수
const displayLocator = (items, index) => {
	// 이전글 생성 후 삽입
	if(items[0].id !== +index + 1) {
		let newPrev = `
			<td colspan="1"><a href="#">이전글</a></td>
    		<td colspan="3"><a href="#" onclick="alert('해당 글이 존재하지 않습니다')">해당 글이 존재하지 않습니다.</a></td>
		`;
		prev.innerHTML = newPrev;
	} else {
		let newPrev = `
			<td colspan="1"><a href="#">이전글</a></td>
    		<td colspan="3"><a href="#" onclick="location.href='/notice-detail?index=${+index + 1}'">${items[0].title}</a></td>
		`;
		prev.innerHTML = newPrev;
	};
	
	// 다음글 생성 후 삽입
	if(items[2].id !== +index - 1) {
		let newNext = `
			<td colspan="1"><a href="#">다음글</a></td>
    		<td colspan="3"><a href="#" onclick="alert('해당 글이 존재하지 않습니다')">해당 글이 존재하지 않습니다.</a></td>
		`;
		next.innerHTML = newNext;
	} else {
		let newNext = `
			<td colspan="1"><a href="#">다음글</a></td>
    		<td colspan="3"><a href="#" onclick="location.href='/notice-detail?index=${+index - 1}'">${items[2].title}</a></td>
		`;
		next.innerHTML = newNext;
	}
};

window.onload = () => {
	let index = getParam('index');
	
	/*
		index로 서버에 해당 게시글 요청
	*/
	
	displayDetail(detailTitle, detailContent, testData, index);
}
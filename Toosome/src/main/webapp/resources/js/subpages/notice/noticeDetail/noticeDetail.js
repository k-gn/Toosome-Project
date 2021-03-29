const detailTitle = document.querySelector('.notice-table thead'); // 공지 세부 타이틀
const detailContent = document.querySelector('#noticeDetail'); // 공지 세부 본문
const prev = document.querySelector('.prev'); // 이전글
const next = document.querySelector('.next'); // 다음글

// 테스트 데이터
const testData = {
	id: "1", 
	title: "새해 연휴 투썸플레이스 매장 영업시간 변경 안내", 
	date: "2020-03-25", 
	content: "안녕하세요. 투썸플레이스입니다. 보다 나은 투썸플레이스 서비스 제공을 위해 시스템 서버 점검을 아래와 같이 진행합니다."
};

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
const displayDetail = (title, content, item) => {
	title.innerHTML = ""; // 타이틀 초기화
	content.innerHTML = ""; // 본문 초기화
	
	// 받은 데이터로 새 타이틀 생성 후 삽입
	let newTitle = document.createElement('tr');
	let titleElement = `
		<th colspan="3">${item.title}</th>
		<th colspan="1">${item.date}</th>
	`;
	newTitle.innerHTML = titleElement;
	title.appendChild(newTitle);
	
	// 받은 데이터로 새 본문 생성 후 삽입
	let newContent = document.createElement('tr');
	let contentElement = `
		<td colspan="4">${item.content}</td>
	`;
	newContent.innerHTML = contentElement;
	content.appendChild(newContent);
};

window.onload = () => {
	let index = getParam('index');
	
	/*
		index로 서버에 해당 게시글 요청
	*/
	
	displayDetail(detailTitle, detailContent, testData);
}
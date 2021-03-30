const detailTitle = document.querySelector('.qna-table thead'); // QnA 세부 타이틀
const detailContent = document.querySelector('#qnaDetail'); // QnA 세부 본문
const commentTitle = document.querySelector('.comment-table thead') // QnA 댓글 타이틀
const commentContent = document.querySelector('#comment'); // QnA 댓글 본문

// 테스트 데이터
const testData = {
		id: 18,
		type: "배송문의", 
		title: "문의드립니다!", 
		content: "문의드르르르리리리립니다.",
		date: "2020-03-25", 
		img: "/resources/img/subpages/news/n001.jpg",
		comment: {
			comment_id: 1,
			comment_writer: "관리자",
			comment_title: "꺼지셍",
			comment_content: "꺼지세염",
			comment_date: "2020-03-26"
		}
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
const displayDetail = (title, content, c_title, c_content, item, index) => {
	title.innerHTML = ""; // 타이틀 초기화
	content.innerHTML = ""; // 본문 초기화
	c_title.innerHTML = ""; // 댓글 타이틀 초기화
	c_content.innerHTML = ""; // 댓글 본문 초기화
	
	if(item.id === +index) {
		// 받은 데이터로 새 타이틀 생성 후 삽입
		let newTitle = document.createElement('tr');
		let titleElement = `
			<th colspan="3">${item.title}</th>
			<th>${item.type}</th>
			<th>${item.date}</th>
		`;
		newTitle.innerHTML = titleElement;
		title.appendChild(newTitle);
		
		// 받은 데이터로 새 본문 생성 후 삽입
		let newContent = document.createElement('tr');
		// 문의사항 이미지 존재 여부
		let existImg = item.img ? `<img src='${item.img}'>` : "";
		let contentElement = `
			<td colspan="5">${item.content}<br>${existImg}</td>
		`;
		newContent.innerHTML = contentElement;
		content.appendChild(newContent);
		
		// 받은 데이터로 새 댓글 타이틀 생성 후 삽입
		let newCommentTitle = document.createElement('tr');
		let c_titleElement = `
			<th colspan="3">${item.comment.comment_title}</td>
			<th>${item.comment.comment_writer}</td>
			<th>${item.comment.comment_date}</td>
		`;
		newCommentTitle.innerHTML = c_titleElement;
		c_title.appendChild(newCommentTitle);
		
		// 받은 데이터로 새 댓글 본문 생성 후 삽입
		let newCommentContent = document.createElement('tr');
		let c_contentElement = `
			<td colspan="5">${item.comment.comment_content}</td>
		`;
		newCommentContent.innerHTML = c_contentElement;
		c_content.appendChild(newCommentContent);
		
	} else {
		alert('잘못된 요청입니다');
		window.history.go(-1);
	}
};

window.onload = () => {
	let index = getParam('index');
	
	/*
		index로 서버에 해당 게시글 요청
	*/
	
	displayDetail(detailTitle, detailContent, commentTitle, commentContent, testData, index);
}
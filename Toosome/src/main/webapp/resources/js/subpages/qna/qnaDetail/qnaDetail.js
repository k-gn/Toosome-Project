const detailTitle = document.querySelector('.qna-table thead'); // QnA 세부 타이틀
const detailContent = document.querySelector('#qnaDetail'); // QnA 세부 본문
const commentTitle = document.querySelector('.comment-table thead') // QnA 댓글 타이틀
const commentContent = document.querySelector('#comment'); // QnA 댓글 본문

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
};

// 댓글 유효성 검사
const enrollCheck = () => {
	const title = document.querySelector('#comment-title');
	const content = document.querySelector('#comment-content');
	
	if(title.value === '') {
		alert('제목 입력란이 비어있습니다.');
		title.focus();
		return false;
	} else if (content.value === '') {
		alert('내용 입력란이 비어있습니다.');
		content.focus();
		return false;
	} 
	
	return true;
};

// 리스트 출력
const displayDetail = (title, content, c_title, c_content, item, index) => {
	title.innerHTML = ""; // 타이틀 초기화
	content.innerHTML = ""; // 본문 초기화
	c_title.innerHTML = ""; // 댓글 타이틀 초기화
	c_content.innerHTML = ""; // 댓글 본문 초기화
	
	// 날짜 변환
	let date = new Date(item[0].qnaBoardRegdate);
	let newDate = `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`;
	
	// 문의 유형
	let type = '';
	switch(item[0].qnaBoardType) {
		case 1: type = '메뉴문의'; break;
		case 2: type = '상품문의'; break;
		case 3: type = '배송문의'; break;
		case 4: type = '창업문의'; break;
		case 5: type = '기타'; break;
	};
	
	if(item[0].qnaBoardId === +index) {
		// 받은 데이터로 새 타이틀 생성 후 삽입
		let newTitle = document.createElement('tr');
		let titleElement = `
			<th colspan="3">제목: ${item[0].qnaBoardTitle}</th>
			<th>문의유형: ${type}</th>
			<th>작성일: ${newDate}</th>
		`;
		newTitle.innerHTML = titleElement;
		title.appendChild(newTitle);
		
		// 받은 데이터로 새 본문 생성 후 삽입
		let newContent = document.createElement('tr');
		// 문의사항 이미지 존재 여부
		let existImg = item[0].qnaBoardImageName ? `<img src='https://toosome.s3.ap-northeast-2.amazonaws.com/${item[0].qnaBoardImageName}' alt="#">` : "";
		let contentElement = `
			<td colspan="5">${item[0].qnaBoardContent}<br>${existImg}</td>
		`;
		newContent.innerHTML = contentElement;
		content.appendChild(newContent);
		
		// 댓글
		if(!item[0].qnaBoardCommentVO) {
			let newCommentTitle = document.createElement('tr');
			let c_titleElement = `
				<th colspan="4">등록된 댓글이 없습니다</td>
				<th></td>
			`;
			newCommentTitle.innerHTML = c_titleElement;
			c_title.appendChild(newCommentTitle);
			
			// 받은 데이터로 새 댓글 본문 생성 후 삽입
			let newCommentContent = document.createElement('tr');
			let c_contentElement = `
				<td colspan="5">등록된 댓글이 없습니다</td>
			`;
			newCommentContent.innerHTML = c_contentElement;
			c_content.appendChild(newCommentContent);
		} else {
			for(let i=0; i<item[0].qnaBoardCommentVO.length; i++) {
				// 받은 데이터로 새 댓글 타이틀 생성 후 삽입
				let newCommentTitle = document.createElement('tr');
				let c_titleElement = `
					<th colspan="3">${item[0].qnaBoardCommentVO[i].qnaBoardCommentTitle}</td>
					<th>${item[0].qnaBoardCommentVO[i].member.memberName}</td>
					<th>${item[0].qnaBoardCommentVO[i].qnaBoardCommentDay}</td>
				`;
				newCommentTitle.innerHTML = c_titleElement;
				c_title.appendChild(newCommentTitle);
				
				// 받은 데이터로 새 댓글 본문 생성 후 삽입
				let newCommentContent = document.createElement('tr');
				let c_contentElement = `
					<td colspan="5">${item[0].qnaBoardCommentVO[i].qnaBoardCommentContent}</td>
				`;
				newCommentContent.innerHTML = c_contentElement;
				c_content.appendChild(newCommentContent);				
			};
		};
	} else {
		alert('잘못된 요청입니다');
		window.history.go(-1);
	}
};

// document ready시 실행 
$(document).ready(() => {
	// param의 index 빼오기
	let index = getParam('index');
	$("#qnaBoardId").val(index);
	// 게시글 데이터 요청 AJAX
	$.ajax({
		url: '/qnadetail?index='+index,
		success: (res) => {
			console.log(res);	
			displayDetail(detailTitle, detailContent, commentTitle, commentContent, res, index);
		},
		error: () => {
			alert('통신장애');
		}
	});	
});
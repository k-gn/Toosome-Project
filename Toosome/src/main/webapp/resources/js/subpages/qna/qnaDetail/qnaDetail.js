const detailTitle = document.querySelector('.qna-table thead'); // QnA 세부 타이틀
const detailContent = document.querySelector('#qnaDetail'); // QnA 세부 본문
const commentContent = document.querySelector('#comment'); // QnA 댓글 본문

let id = ''; // 현재 로그인된 회원번호

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

// 댓글 삭제 버튼
const deleteHandler = (id) => {
	// 서버에 데이터 삭제 요청 AJAX
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/qnacommentdelete", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		data: {qnaBoardCommentId: id}, //서버로 전송할 데이터
		success: (result) => {
			if(result === 'deleteSuccess') {
				alert("댓글 삭제 완료");
			}else if(result === 'deleteFail') {
				alert("댓글 삭제 실패");
			}
			location.reload();
		},
		error: () => {
			alert('시스템과에 문의하세요');
			//history.back();
		}
	});
};

// 댓글 업데이트 버튼
const updateHandler = (e, id) => {
	let parent = e.parentNode.parentNode;
	let tds = parent.children;
	let commentTitle = tds[0].children[0].value;
	let sibling = parent.nextSibling;
	let commentContent = sibling.children[0].children[0].value;
	
	// 서버에 데이터 업데이트 요청 AJAX
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/qnacommentupdate", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		data: { //서버로 전송할 데이터
			qnaBoardCommentId: id,
			qnaBoardCommentTitle: commentTitle,
			qnaBoardCommentContent: commentContent
		},
		success: (result) => {
			if(result === 'updateSuccess') {
				alert("댓글 수정 완료");
			}else if(result === 'updateFail') {
				alert("댓글 수정 실패");
			}
			location.reload();
		}, 
		error: (e) => {
			alert('시스템과에 문의하세요');
			//history.back();
		}
	});
};

// 리스트 출력
const displayDetail = (title, content, c_content, item, index) => {
	title.innerHTML = ""; // 타이틀 초기화
	content.innerHTML = ""; // 본문 초기화
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
		$("#qnaBoardId").val(item[0].qnaBoardId);
		
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
		if(item[0].qnaBoardComment.length === 0) {
			let newCommentTitle = document.createElement('tr');
			let c_titleElement = `<td colspan="4">등록된 댓글이 없습니다</td>`;
			newCommentTitle.innerHTML = c_titleElement;
			c_content.appendChild(newCommentTitle);
			
		} else {
			for(let i=0; i<item[0].qnaBoardComment.length; i++) {
				
				let style = '';
				if(item[0].qnaBoardComment[i].qnaCommentWriter === '관리자') {
					style = "style='color:blue;'";
				}
				// 받은 데이터로 새 댓글 타이틀 생성 후 삽입
				let commentId = item[0].qnaBoardComment[i].qnaBoardCommentId;
				let title = item[0].qnaBoardComment[i].qnaBoardCommentTitle;
				let newCommentTitle = document.createElement('tr');
				let c_titleElements = `
					<td scope="col">제목: ${+id === +item[0].qnaBoardComment[i].memberMemberCommentId ? `<input type="text" value=${title} />`: title}</td>
					<td scope="col" ${style}>작성자: ${item[0].qnaBoardComment[i].qnaCommentWriter}</td>
					<td scope="col">작성일: ${item[0].qnaBoardComment[i].qnaBoardCommentDay}</td>
					${+id === +item[0].qnaBoardComment[i].memberMemberCommentId ?
					 `<td><button class="comment-btn" onclick="deleteHandler(${commentId});">삭제</button></td><td><button class="comment-btn" onclick="updateHandler(this,${commentId});">수정</button></td>` 
					: '<td scope="col" colspan="2"></td>'}
				`;
				newCommentTitle.innerHTML = c_titleElements;
				c_content.appendChild(newCommentTitle);
				
				// 받은 데이터로 새 댓글 본문 생성 후 삽입
				let content = item[0].qnaBoardComment[i].qnaBoardCommentContent;
				let newCommentContent = document.createElement('tr');
				let c_contentElements = `
					<td colspan="6">${+id === +item[0].qnaBoardComment[i].memberMemberCommentId ? `<textarea rows="5">${content}</textarea>`: content}</td>
				`;
				newCommentContent.innerHTML = c_contentElements;
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
	id = $('input[name=memberMemberCommentId]').val();
	
	$.ajax({
		url: '/qnadetail?index='+index,
		success: (res) => {
			console.log(res);	
			displayDetail(detailTitle, detailContent, commentContent, res, index);
		},
		error: () => {
			alert('통신장애');
		}
	});	
});
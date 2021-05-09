const detailTitle = document.querySelector('.notice-table thead'); // 공지 세부 타이틀
const detailContent = document.querySelector('#noticeDetail'); // 공지 세부 본문
const prev = document.querySelector('.prev'); // 이전글
const next = document.querySelector('.next'); // 다음글

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
	// 날짜 변환
	let date = new Date(items[1].noticeBoardRegdate);
	let newDate = `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`;
	
	if(+items[1].noticeBoardId === +index) {
		// 받은 데이터로 새 타이틀 생성 후 삽입
		let newTitle = document.createElement('tr');
		let titleElement = `
			<th colspan="3">제목: ${items[1].noticeBoardTitle}</th>
			<th colspan="1">작성일: ${newDate}</th>
		`;
		newTitle.innerHTML = titleElement;
		title.appendChild(newTitle);
		
		// 받은 데이터로 새 본문 생성 후 삽입
		let newContent = document.createElement('tr');
		let contentElement = `
			<td colspan="4">${items[1].noticeBoardContent}</td>
		`;
		newContent.innerHTML = contentElement;
		content.appendChild(newContent);
		
		displayLocator(items, index);
	} else {
		alert('잘못된 요청입니다');
	}
};

// 이전글, 다음글 생성 함수
const displayLocator = (items, index) => {
	// 이전글 생성 후 삽입
	if(!items[0].noticeBoardId) {
		let newPrev = `
			<td colspan="1">이전글</th>
    		<td colspan="3"><a onclick="alert('해당 글이 존재하지 않습니다')">해당 글이 존재하지 않습니다.</a></td>
		`;
		prev.innerHTML = newPrev;
	} else {
		let newPrev = `
			<td colspan="1">이전글</th>
    		<td colspan="3"><a onclick="location.href='/notice-detail?index=${items[0].noticeBoardId}'">${items[0].noticeBoardTitle}</a></td>
		`;
		prev.innerHTML = newPrev;
	};
	
	// 다음글 생성 후 삽입
	if(!items[2].noticeBoardId) {
		let newNext = `
			<td colspan="1">다음글</td>
    		<td colspan="3"><a onclick="alert('해당 글이 존재하지 않습니다')">해당 글이 존재하지 않습니다.</a></td>
		`;
		next.innerHTML = newNext;
	} else {
		let newNext = `
			<td colspan="1">다음글</td>
    		<td colspan="3"><a onclick="location.href='/notice-detail?index=${items[2].noticeBoardId}'">${items[2].noticeBoardTitle}</a></td>
		`;
		next.innerHTML = newNext;
	}
};

// document ready시 실행 
$(document).ready(() => {
	// param의 index 빼오기
	let index = getParam('index');
	// 게시글 데이터 요청 AJAX
	$.ajax({
		url: '/noticedetail?index='+index,
		success: (res) => {
			// 데이터 역순		
			const newRes = res.reverse();
			const result = newRes.sort((a,b) => {
				return a.noticeBoardId - b.noticeBoardId;
			});
			
			// null data 생성
			const nullData = {
				noticeBoardId: null,
				noticeBoardTitle: null,
				noticeBoardContent: null,
				noticeBoardViewCount: null,
				noticeBoardRegdate: null
			};
			
			// 게시글이 하나일 때
			if(result.length === 1) {
				result.unshift(nullData);
				result.push(nullData);
			}
			
			// 처음 혹은 마지막 게시물
			if(result.length === 2) {
				
				// 첫 게시물 
				if(+result[1].noticeBoardId === +index) {
					result.push(nullData);
				} else { // 마지막 게시물
					result.unshift(nullData);
				}
			}
			displayDetail(detailTitle, detailContent, result, index);
		},
		error: () => {
			alert('통신장애');
		}
	});	
});
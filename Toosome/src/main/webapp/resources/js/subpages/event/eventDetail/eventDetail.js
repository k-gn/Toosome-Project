const detailTitle = document.querySelector('.event-table thead'); // 이벤트 세부 타이틀
const detailContent = document.querySelector('#eventDetail'); // 이벤트 세부 본문
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
	let date = new Date(items[1].eventBoardDetailVO.eventBoardDetailDay);
	let newDate = `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`;

	if(+items[1].eventBoardId === +index) {
		// 받은 데이터로 새 타이틀 생성 후 삽입
		let newTitle = document.createElement('tr');
		let titleElement = `
			<th colspan="3">제목: ${items[1].eventBoardTitle}</th>
			<th colspan="1">작성일: ${newDate} | 조회수: ${items[1].eventBoardViewCount}</th>
		`;
		newTitle.innerHTML = titleElement;
		title.appendChild(newTitle);
		
		// 받은 데이터로 새 본문 생성 후 삽입
		let newContent = document.createElement('tr');
		let contentElement = `
			<td colspan="4">
				<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${items[1].eventBoardDetailVO.eventBoardDetailImageRoute}${items[1].eventBoardDetailVO.eventBoardDetailImageName}.${items[1].eventBoardDetailVO.eventBoardDetailImageExtention}" alt="#">
			</td>
		`;
		newContent.innerHTML = contentElement;
		content.appendChild(newContent);
		
		displayLocator(items);
	} else {
	    window.history.go(-1);
		alert('잘못된 요청입니다');
	};
};

// 이전글, 다음글 생성 함수
const displayLocator = (items) => {
	// 이전글 생성 후 삽입
	if(!items[0].eventBoardId) {
		let newPrev = `
			<td colspan="1"><a >이전글</a></td>
    		<td colspan="3"><a  onclick="alert('해당 글이 존재하지 않습니다')">해당 글이 존재하지 않습니다.</a></td>
		`;
		prev.innerHTML = newPrev;
	} else {
		let newPrev = `
			<td colspan="1"><a >이전글</a></td>
    		<td colspan="3"><a  onclick="location.href='/event-detail?index=${items[0].eventBoardId}'">${items[0].eventBoardTitle}</a></td>
		`;
		prev.innerHTML = newPrev;
	};
	
	// 다음글 생성 후 삽입
	if(!items[2].eventBoardId) {
		let newNext = `
			<td colspan="1"><a >다음글</a></td>
    		<td colspan="3"><a  onclick="alert('해당 글이 존재하지 않습니다')">해당 글이 존재하지 않습니다.</a></td>
		`;
		next.innerHTML = newNext;
	} else {
		let newNext = `
			<td colspan="1"><a >다음글</a></td>
    		<td colspan="3"><a onclick="location.href='/event-detail?index=${items[2].eventBoardId}'">${items[2].eventBoardTitle}</a></td>
		`;
		next.innerHTML = newNext;
	};
};

// document ready시 실행 
$(document).ready(() => {
	// param의 index 빼오기
	let index = getParam('index');
	// 게시글 데이터 요청 AJAX
	$.ajax({
		url: '/eventdetail?index='+index,
		success: (res) => {	
			// null data 생성
			const nullData = {
				eventBoardId: null,
				eventBoardDetailImageRoute: null,
				eventBoardDetailImageName: null,
				eventBoardDetailImageExtention: null,
				eventBoardDetailDay: null,
			};
			// 게시글이 하나일 때
			if(res.length === 1) {
				res.unshift(nullData);
				res.push(nullData);
			}
			
			// 처음 혹은 마지막 게시물일 때
			if(res.length === 2) {
				// 첫 게시물 
				if(+res[0].eventBoardId !== +index) {
					res.push(nullData);
				} else { // 마지막 게시물
					res.unshift(nullData);
				}
			}
			displayDetail(detailTitle, detailContent, res, index);
		},
		error: () => {
			alert('통신장애');
		}
	});	
});
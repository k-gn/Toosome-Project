const searchType = document.querySelector('#searchType'); // 검색어 선택
const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const qnaDate = document.querySelector('#qnaDate'); // 작성일 기간선택
const qnaDatePeriod = document.querySelector('#qnaDatePeriod'); // 작성일 기간선택 버튼박스
const qnaPeriods = document.querySelectorAll('.period.qna'); // 작성일 기간 버튼들
const qnaCalendar = document.querySelector('#calendar1'); // 작성일 달력1
const qnaCalendar2 = document.querySelector('#calendar2'); // 작성일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const boardContainer = document.querySelector('#board-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블
const enrollSubmitBtn = document.querySelector('#enroll-submit'); // 글등록 버튼
const commentUpdateBtn = document.querySelector('#comment-update-submit'); // 댓글 수정 버튼
const commentSelect = document.querySelector('#comment-list'); // 댓글 리스트 select box

let board = {};
let commentList = []; // 댓글 리스트
let condition = ''; // 검색 타입
let keyword = ''; // 검색 제목
let startRegDate = ''; // 검색 시작일
let endRegDate = ''; // 검색 종료일
let rows = 10000;
let boardId = '';
let url = '';

// 댓글 등록 유효성 검사
const enrollCheck = (title,content) => {
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

// 댓글 등록 버튼 event hook
enrollSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const e_title = document.querySelector('#enroll-title');
	const e_content = document.querySelector('#enroll-content');
	
	if(!enrollCheck(e_title, e_content)) {
		return;
	} else {
		document.querySelector('#enroll-form').submit();
	}
});

// 댓글 수정 버튼 event hook
commentUpdateBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const c_title = document.querySelector('#comment-title');
	const c_content = document.querySelector('#comment-content');
	
	if(!enrollCheck(c_title, c_content)) {
		return;
	} else {
		document.querySelector('#comment-update-form').submit();
	}
});

// 댓글 등록시 등록 모달창에 boardId set
const setBoardId = (index) => {
	$('input[name=qnaQnaBoardId]').val(index);
};

// 글 삭제 버튼
const delBtnFunc = ()  => {
	let flag = confirm('정말로 삭제하시겠습니까?');
	if(flag) {
		$.ajax({
			type: 'get',
			url: '/admin/qnaboard-delete/' + boardId,
			headers: {
				"Content-Type": "application/json"
			}, //요청 헤더 정보
			success: () => {
				alert('글삭제에 성공하였습니다.');
				location.reload();
			},
			error: () => {
				alert('통신장애');
				window.history.back();
			}
		})
	};
};

// 댓글 삭제 버튼
const delBtnFunc2 = ()  => {
	let commentId = commentSelect.options[commentSelect.selectedIndex].value;
	let flag = confirm('정말로 삭제하시겠습니까?');
	if(flag) {
		$.ajax({
			type: 'get',
			url: '/admin/qnaboardcomment-delete/',
			headers: {
				"Content-Type": "application/json"
			}, //요청 헤더 정보
			data: {
				qnaBoardCommentId: +commentId
			},
			success: () => {
				alert('댓글 삭제에 성공하였습니다.');
				location.reload();
			},
			error: () => {
				alert('통신장애');
				window.history.back();
			}
		})
	};
};


// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'use') {
		qnaDatePeriod.style.display = 'inline';
	} else {
		qnaDatePeriod.style.display = 'none';
	};
};

// on 클래스 제거
const removeOn = (periods) => {
	periods.forEach((period) => {
		if(period.classList.contains('on')) {
			period.classList.remove('on');			
		}
	});
};

// 날짜 계산 (moment.js)
const calcDate = (value, calendar) => {
	const [num, unit] = value.split('');
	const today = moment();
	const newDate = moment(today).subtract(num, unit).format('YYYY-MM-DD');
	calendar.value = newDate;
};

// init
const calendarInit = () => {
	removeOn(qnaPeriods);
	const today = moment().format('YYYY-MM-DD');
	qnaCalendar.value = today;
	qnaCalendar2.value = today;
};

// 기간 버튼 event hook
qnaPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(qnaPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, qnaCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	qnaDate.options[0].selected = 'true';
	qnaDatePeriod.style.display = 'none';
	calendarInit();
};

resetBtn.addEventListener('click', resetHandler);

// 리스트 출력하기
const showList = (result, wrapper) => {
	wrapper.innerHTML = ''; // 테이블 초기화
	
	// 검색 결과가 없을 경우
	if(result.length === 0) {
		let newItem = document.createElement('tr');
		let itemElement = `
			<td colspan="6">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	};
	
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < result.length; i++) {

		let newEl = document.createElement('tr');
		let content = `
					<tr>
                      <td>
                        ${result[i].qnaBoardId}
                      </td>
                      <td>
                        ${result[i].qnaBoardType}
                      </td>
                      <td onclick="listHandler(this);">
                        <a href="#">${result[i].qnaBoardTitle}</a>
                      </td>
                      <td>
                        ${result[i].qnaBoardContent}
                      </td>
					  <td>
                        ${result[i].qnaBoardRegdate}
                      </td>
					  <td class="td-actions">
		                <button type="button" rel="tooltip" class="btn btn-info" data-toggle="modal" data-target="#commentListModal" onclick="getCommentList(${result[i].qnaBoardId});">댓글보기</button>
                      	<button type="button" rel="tooltip" class="btn btn-success" data-toggle="modal" data-target="#commentModal" onclick="setBoardId(${result[i].qnaBoardId});">댓글등록</button>
                      </td>
                    </tr>			
				`;
		newEl.innerHTML = content;
		wrapper.appendChild(newEl);
	};	
};

// 페이징 처리 후 데이터 출력
const setData = (result, wrapper, rows) => {
	$('#pagination').pagination({
	    dataSource: result,
	    pageSize: rows,
	    pageNumber: 1,
	    callback: function(data, pagination) {
			showList(data, wrapper);					
	    }
	});
};

// AJAX 댓글 리스트 불러오기
const getCommentList = (index) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/qnacommentlist", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: { //서버로 전송할 데이터
			qnaQnaBoardId : index
		}, 
		success: (result) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			if(result.length !== 0) {
				commentList = [...result]; // 댓글리스트 복사
				commentSelect.innerHTML = ''; // select 초기화
				commentUpdateBtn.disabled = false;
				document.querySelector('#comment-delete').disabled = false;
				// option 생성 후 삽입
				for(let i=0; i<result.length; i++) {
					let option = document.createElement('option');
					option.setAttribute('value', result[i].qnaBoardCommentId);
					option.innerText = `${i + 1}번 댓글`;
					commentSelect.appendChild(option);
				}
				
				document.querySelector('#comment-title').innerText = result[0].qnaBoardCommentTitle;
				document.querySelector('#comment-content').innerText = result[0].qnaBoardCommentContent;
				document.querySelector('#comment-writer').value = result[0].qnaCommentWriter;
				document.querySelector('#hidden-id').value = result[0].qnaBoardCommentId;
				commentSelect.options[0].selected = true;				
			} else {
				document.querySelector('#comment-title').innerText = '댓글 없음';
				document.querySelector('#comment-content').innerText = '댓글 없음';
				document.querySelector('#comment-writer').value = '';
				document.querySelector('#comment-delete').disabled = true;
				commentUpdateBtn.disabled = true;
			}
		}, 
		error: () => {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// AJAX 검색 리스트 불러오기
const getList = (url, board, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url, //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: board, //서버로 전송할 데이터
		success: (result) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			// 검색 건수 출력
			let count = `검색 결과 : ${result.length}건`;
			searchResult.innerText = count;
			setData(result, wrapper, rows);
		}, 
		error: () => {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	keyword = ''; // 검색 제목
	condition = ''; // 검색 타입
    startRegDate = ''; // 검색 시작일
    endRegDate = ''; // 검색 종료일
	
	// 검색어
	if(searchInput.value !== '') {
		if(searchType.options[searchType.selectedIndex].value === 'title') { // 제목으로 검색시
			condition = searchType.options[searchType.selectedIndex].value;
			keyword = searchInput.value;	
		} else if(searchType.options[searchType.selectedIndex].value === 'content') { // 내용으로 검색시
			condition = searchType.options[searchType.selectedIndex].value;
			keyword = searchInput.value;			
		} else { // 작성자로 검색시
			condition = searchType.options[searchType.selectedIndex].value;
			keyword = searchInput.value;
		};
	};
	
	// 가입일자
	if(qnaDate.options[qnaDate.selectedIndex].value === 'use') {
		startRegDate = moment(qnaCalendar.value).format('YYYY-MM-DD');
		endRegDate = moment(qnaCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	board = {
		keyword,
		condition,
		startRegDate,
		endRegDate,
	};
	
	rows = 10000;
	url = '/admin/qnaboardsearch';
	getList(url, board, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	let id = e.parentNode.children[0].innerText;
	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/qnaboarddetail", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		data: {
			qnaBoardId: id
		},
		dataType: "json", //응답받을 데이터의 형태
		success: (res) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			boardId = res[0].qnaBoardId;
			$('input[name=qnaBoardId]').val(res[0].qnaBoardId);			
			$('input[name=newsBoardViewCount]').val(res[0].newsBoardViewCount);			
			$('input[name=qnaBoardRegdate]').val(res[0].qnaBoardRegdate);	
			$('#modal-isLocked').val(res[0].qnaBoardSecret).prop('selected', true);
			$('#detail-title').val(res[0].qnaBoardTitle);
			$('#detail-content').val(res[0].qnaBoardContent);			
			let imageURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/img/qnaImg/${res[0].qnaBoardImageName}`;
			$('#qnaImg').attr("src", imageURL);
		}, 
		error: () => {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
	boardContainer.style.display = 'block';
	$("#detail-title").focus();
};

// 정렬 select 핸들러
const selectHandler = (select) => {
	// selected value
	let value = select.options[select.selectedIndex].value;
	
	// init
	rows = +value;
	url = '/admin/qnaboardmanagement';
	getList(url, board, listTable, rows);
};

// 댓글 리스트 select change 핸들러
const commentChange = (select) => {
	const title = document.querySelector('#comment-title');
	const content = document.querySelector('#comment-content');
	const writer = document.querySelector('#comment-writer');
	
	title.innerText = '';
	content.innerText = '';
	writer.value = '';
	
	commentList.forEach(list => {
		if(+list.qnaBoardCommentId === +select.options[select.selectedIndex].value) {
			title.innerText = list.qnaBoardCommentTitle;
			content.innerText = list.qnaBoardCommentContent;
			writer.value = list.qnaCommentWriter;
			document.querySelector('#hidden-id').value = list.qnaBoardCommentId;
			title.focus();
		};
	});
};


// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainer.style.display = 'none';
});

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	url = '/admin/qnaboardmanagement';
	getList(url, board, listTable, rows);
}); 

const searchInput = document.querySelector('#search-text'); // 검색어 인풋
const newsDate = document.querySelector('#newsDate'); // 작성일 기간선택
const newsDatePeriod = document.querySelector('#newsDatePeriod'); // 작성일 기간선택 버튼박스
const newsPeriods = document.querySelectorAll('.period.news'); // 작성일 기간 버튼들
const newsCalendar = document.querySelector('#calendar1'); // 작성일 달력1
const newsCalendar2 = document.querySelector('#calendar2'); // 작성일 달력2
const resetBtn = document.querySelector('#search-reset'); // 검색 초기화 버튼
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const boardContainer = document.querySelector('#board-modal'); // 프로필 컨테이너
const modalCancelBtn = document.querySelector('#modal-cancel'); // 모달 취소 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블
const enrollSubmitBtn = document.querySelector('#enroll-submit'); // 글등록 버튼
const updateSubmitBtn = document.querySelector('#update-submit'); // 업데이트 버튼


let board = {};
let keyword = ''; // 검색 제목
let startRegDate = ''; // 검색 시작일
let endRegDate = ''; // 검색 종료일
let rows = 10000;
let boardId = '';
let url = '';

// 글 등록 유효성 검사
const enrollCheck = (title,thumb,image) => {
	if(title.value === '') {
		alert('제목 입력란이 비어있습니다.');
		title.focus();
		return false;
	} else if (thumb.value === '') {
		alert('썸네일 이미지를 선택하세요.');
		thumb.focus();
		return false;
	} else if (image.value === '') {
		alert('본문 이미지를 선택하세요.');
		image.focus();
		return false;
	};
	return true;
};

// 업데이트 유효성 검사
const updateCheck = (title) => {
	if(title.value === '') {
		alert('제목 입력란이 비어있습니다.');
		title.focus();
		return false;
	} 
	return true;
};

// 글등록 버튼 event hook
enrollSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const e_title = document.querySelector('#enroll-title');
	const e_thumb = document.querySelector('#enroll-thumb');
	const e_image = document.querySelector('#enroll-image');
	
	if(!enrollCheck(e_title,e_thumb,e_image)) {
		return;
	} else {
		document.querySelector('#enroll-form').submit();
	}
});

// 업데이트 버튼 event hook
updateSubmitBtn.addEventListener('click', (e) => {
	e.preventDefault();
	const u_title = document.querySelector('#detail-title');
	
	if(!enrollCheck(u_title)) {
		return;
	} else {
		document.querySelector('#update-form').submit();
	}
});

// 글 삭제 버튼
const delBtnFunc = ()  => {
	let flag = confirm('정말로 삭제하시겠습니까?');
	if(flag) {
		$.ajax({
			type: 'get',
			url: '/admin/newsboard-delete',
			headers: {
				"Content-Type": "application/json"
			}, //요청 헤더 정보
			data: {
				newsBoardId: boardId
			},
			success: () => {
				
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
		newsDatePeriod.style.display = 'inline';
	} else {
		newsDatePeriod.style.display = 'none';
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
	removeOn(newsPeriods);
	const today = moment().format('YYYY-MM-DD');
	newsCalendar.value = today;
	newsCalendar2.value = today;
};

// 기간 버튼 event hook
newsPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(newsPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, newsCalendar);
	});
});

// 리셋 버튼 핸들러
const resetHandler = () => {
	searchType.options[0].selected = 'true';
	searchInput.value = '';
	newsDate.options[0].selected = 'true';
	newsDatePeriod.style.display = 'none';
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
			<td colspan="5">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	};
	
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < result.length; i++) {

		let newEl = document.createElement('tr');
		newEl.setAttribute( 'onclick', 'listHandler(this)' );
		let content = `
          <td>
            ${result[i].newsBoardId}
          </td>
          <td>
            ${result[i].newsBoardTitle}
          </td>
          <td>
            ${result[i].newsBoardViewCount}
          </td>
          <td>
            ${result[i].newsBoardRegdate}
          </td>
          <td>
            <a target="_blank" href="https://toosome.s3.ap-northeast-2.amazonaws.com/${result[i].newsBoardImageRoute}/${result[i].newsBoardImageName}.${result[i].newsBoardImageExtention}">상세보기</a>
          </td>
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
		error: function() {
			alert('시스템과에 문의하세요');
			history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	keyword = ''; // 검색 제목
    startRegDate = ''; // 검색 시작일
    endRegDate = ''; // 검색 종료일
	
	// 검색 이름 & 검색 이메일
	keyword = searchInput.value;
	
	// 가입일자
	if(newsDate.options[newsDate.selectedIndex].value === 'use') {
		startRegDate = moment(newsCalendar.value).format('YYYY-MM-DD');
		endRegDate = moment(newsCalendar2.value).format('YYYY-MM-DD');
	}
	
	// JSON Data
	board = {
		keyword,
		startRegDate,
		endRegDate,
	};
	
	rows = 10000;
	url = '/admin/newsboardsearch';
	getList(url, board, listTable, rows);
};

submitBtn.addEventListener('click', submitHandler);

// 리스트 항목 클릭 핸들러
const listHandler = (e) => {
	const tds = e.children;
	const id = tds[0].innerText;
	
	/* index로 AJAX 요청 */
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/newsboardmanagement", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		data: {
			newsBoardId: id
		},
		dataType: "json", //응답받을 데이터의 형태
		success: (res) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log(res);
			/*boardId = res[0].newsBoardId;
			$('input[name=newsBoardId]').val(res[0].newsBoardId);			
			$('input[name=newsBoardViewCount]').val(res[0].newsBoardViewCount);			
			$('input[name=newsBoardRegdate]').val(res[0].newsBoardRegdate);	
			$('#detail-title').val(res[0].newsBoardTitle);
			let thumbnailURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/${res[0].newsBoardImageRoute}${res[0].newsBoardImageName}.${res[0].newsBoardImageExtention}`;		
			$('#thumbnail').attr("src", thumbnailURL);	
			let imageURL = `https://toosome.s3.ap-northeast-2.amazonaws.com/${res[0].newsBoardImageRoute}${res[0].newsBoardImageName}.${res[0].newsBoardImageExtention}`;
			$('#detail-img').attr("src", imageURL);
			$('input[name=newsBoardDetailId]').val(res[0].newsBoardDetailVO.newsBoardDetailId);*/
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
	url = '/admin/newsboardmanagement';
	getList(url, board, listTable, rows);
};


// 모달 취소 버튼 핸들러
modalCancelBtn.addEventListener('click', (e) => {
	e.preventDefault();
	boardContainer.style.display = 'none';
});

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	url = '/admin/newsboardmanagement';
	getList(url, board, listTable, rows);
}); 

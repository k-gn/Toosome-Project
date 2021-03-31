const radioBtns = document.querySelectorAll('.qna-radio-container input'); // 라디오 버튼
const inputPwd = document.querySelector('.qna-pwd-container input'); // 비밀번호 입력란
const inputTitle = document.querySelector('.qna-title-container input'); // 제목 입력란
const inputContent = document.querySelector('.qna-content-container textarea'); //내용 입력란
const submitBtn = document.querySelector('#submit'); // 등록 버튼

// 라디오 버튼 클릭 이벤트 hook
radioBtns.forEach(btn => {
	btn.addEventListener('click', (e) => {
		e.target.checked = true;
		if(e.target.value === 'public') {
			inputPwd.disabled = true;
		} else {
			inputPwd.disabled = false;
		};
	});
});

// input 유효성 검사
submitBtn.addEventListener('click', () => {
	if(inputTitle.value === '') {
		alert('제목 입력란이 비어있습니다.');
		inputTitle.focus();
	};
	
	if(inputContent.value === '') {
		alert('내용 입력란이 비어있습니다.');
		inputContent.focus();
	};
	
	if(!inputPwd.disabled) {
		if(inputPwd.value === '') {
			alert('비밀번호 입력란이 비어있습니다.');
			inputPwd.focus();
		};
	};
});
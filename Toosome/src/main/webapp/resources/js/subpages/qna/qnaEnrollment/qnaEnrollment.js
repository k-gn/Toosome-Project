const radioBtns = document.querySelectorAll('.qna-radio-container input'); // 라디오 버튼
const inputPwd = document.querySelector('.qna-pwd-container input'); // 비밀번호 입력란
const inputTitle = document.querySelector('.qna-title-container input'); // 제목 입력란
const inputContent = document.querySelector('.qna-content-container textarea'); //내용 입력란

// 라디오 버튼 클릭 이벤트 hook
radioBtns.forEach(btn => {
	btn.addEventListener('click', (e) => {
		e.target.checked = true;
		if(e.target.value === '1') {
			inputPwd.disabled = false;
		} else {
			inputPwd.disabled = true;
		};
	});
});

// 이미지
document.getElementById('input-file').addEventListener('change', (e) => {
	document.getElementById('file-path').value = e.target.value;
});

// 유효성 검사
const enrollCheck = () => {
	if(inputTitle.value === '') {
		alert('제목 입력란이 비어있습니다.');
		inputTitle.focus();
		return false;
	} else if(inputContent.value === '') {
		alert('내용 입력란이 비어있습니다.');
		inputContent.focus();
		return false;
	} else if(!inputPwd.disabled) {
		if(inputPwd.value === '') {
			alert('비밀번호 입력란이 비어있습니다.');
			inputPwd.focus();
			return false;
		};
	} else {
		return true;
	}
};
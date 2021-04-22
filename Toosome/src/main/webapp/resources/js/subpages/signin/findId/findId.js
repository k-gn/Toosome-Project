const authBtn = document.querySelector('#sns'); // 인증하기 버튼
const modal = document.querySelector('#sms-modal'); // 모달창
const cancleBtn = document.querySelector('#cancle'); // 모달 취소 버튼
const codeBtn = document.querySelector('#code'); // 모달 인증코드 받기 버튼
const nameInput = document.querySelector('#sms-name'); // 이름 입력창
const phoneInput = document.querySelector('#sms-phone'); // 전화번호 입력창
const codeInput = document.querySelector('#sms-code'); // 인증코드 입력창
const codeContainer = document.querySelector('#code-container'); // 인증코드 입력 컨테이너

// 인증하기 버튼 click event hook
authBtn.addEventListener('click', () => {
	modal.style.display = 'block';
});

// 모달 취소버튼 click event hook
cancleBtn.addEventListener('click', () => {
	nameInput.value = '';
	phoneInput.value = '';
	codeInput.value = '';
	codeContainer.style.display = 'none';
	modal.style.display = 'none';
})

// 인증코드 받기
const getCode = () => {
	let phoneNumber = phoneInput.value;
	let smsName = nameInput.value;
	let nameCheck = false; // 이름 유효성
	let phoneCheck = false; // 전화번호 유효성
	
	// 핸드폰 번호 정규표현식
	const authCodePattern = /[0123456789]{11}/;
	
	// 유효성 검사
	if(smsName === '') {
		alert('이름 입력란이 비어있습니다.');
		nameInput.focus();
		return nameCheck;
	} else {
		nameCheck = true;		
	};
	
	if(phoneNumber === '') {
		alert('핸드폰 번호 입력란이 비어있습니다.');
		phoneInput.focus();
		return phoneNumber;
	} else if (!authCodePattern.test(phoneNumber)) {
		alert('핸드폰 번호가 올바르지 않습니다.');
		phoneInput.value = '';
		return phoneNumber;
	} else {
		phoneCheck = true;		
	}
	
	// AJAX 요청
	if(!nameCheck || !phoneCheck){
		return false;
	} else {
		document.querySelector('.modal-input.code').style.display = 'block';
		
		$.ajax({                
	    	type : "GET",
	        url : "sendSms?phoneNumber=" + phoneNumber,
	        data : {
	            smsName
	        },
	        success : function(res) {
	            if(res=="18"){
	                alert("핸드폰 번호와 이름이 일치하지 않습니다.");
					nameInput.value = '';
					phoneInput.value = '';
					codeInput.value = '';
					codeContainer.style.display = 'none';
					modal.style.display = 'none';
					return false;
	            }else{
	                alert("인증 번호 전송 완료")
	                $("#sms-confirm").click(function() {
	                    if ($.trim(res) == $("#sms-code").val()) {
							alert('인증 성공');
	                        $.ajax({
	                        	type : "GET",
	                        	url : "sendEmail?phoneNumber=" + phoneNumber,
	                        	success : function(win) {
									document.querySelector('.modal-content').style.display = 'none';
									const findedId = document.querySelector('#finded-id');
									const span = document.createElement('span');
									span.innerHTML = `
										회원님의 아이디는 <strong>${win}</strong>입니다.<br>
										로그인 페이지로 이동하려면 아래 버튼을 클릭하세요.
									`;
									findedId.appendChild(span);
									document.querySelector('.confirm-ok').style.display = 'block';
								},
								error : () => {
									alert('통신장애');
								}
	                        });
	                    } else {
	                        document.querySelector('.sms-error').style.display = 'block';
	                    };
	                });
	            };
	        }
	    });
	};
};

// 인증코드 이벤트 hook
codeBtn.addEventListener('click', getCode);
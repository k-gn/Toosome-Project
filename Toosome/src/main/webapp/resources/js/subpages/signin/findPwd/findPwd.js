const authBtn = document.querySelector('#sns'); // 인증하기 버튼
const modal = document.querySelector('#sms-modal'); // 모달창
const cancleBtn = document.querySelector('#cancle'); // 모달 취소 버튼
const codeBtn = document.querySelector('#code'); // 모달 인증코드 받기 버튼
const emailInput = document.querySelector('#sms-email'); // 이메일 입력창
const phoneInput = document.querySelector('#sms-phone'); // 전화번호 입력창
const codeInput = document.querySelector('#sms-code'); // 인증코드 입력창

// 인증하기 버튼 click event hook
authBtn.addEventListener('click', () => {
	modal.style.display = 'block';
});

// 모달 취소버튼 click event hook
cancleBtn.addEventListener('click', () => {
	emailInput.value = '';
	phoneInput.value = '';
	codeInput.value = '';
	modal.style.display = 'none';
})

// 인증코드 받기
const getCode = () => {
	let phoneNumber = phoneInput.value;
	let smsEmail = emailInput.value;
	let emailCheck = false; // 이메일 유효성
	let phoneCheck = false; // 전화번호 유효성
	
	// 핸드폰 번호 정규표현식
	const authCodePattern = /[0123456789]{11}/;
	// 이메일 정규표현식
	const emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
	
	// 유효성 검사
	if(smsEmail === '') {
		alert('이메일 입력란이 비어있습니다.');
		emailInput.focus();
		return emailCheck;
	} else if (!emailPattern.test(smsEmail)){
		alert('이메일이 올바르지 않습니다.')
		emailInput.value = '';
		return emailCheck;
	} else {
		emailCheck = true;
	}
	
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
	if(!emailCheck || !phoneCheck){
		return false;
	} else {
		document.querySelector('.modal-input.code').style.display = 'block';
		$.ajax({                
	    	type : "GET",
	        url : "sendPassword?phoneNumber=" + phoneNumber,
	        data : {
	            "email" : smsEmail
	        },
	        success : function(res) {
	            if(res=="18"){
	                alert("ID와 핸드폰 번호가 일치하지 않습니다.");
					emailInput.value = '';
					phoneInput.value = '';
					codeInput.value = '';
					modal.style.display = 'none';
					return false;
	            }else{
	                alert("인증 번호 전송 완료")
	                $("#sms-confirm").click(function() {
	                    if ($.trim(res) == $("#sms-code").val()) {
							alert('인증 성공');
	                        $.ajax({
	                        	type : "GET",
	                        	url : "sendRepassword?phoneNumber=" + phoneNumber,
	                        	success : function(win) {
									document.querySelector('.modal-content').style.display = 'none';
									const findedPwd = document.querySelector('#finded-pwd');
									const span = document.createElement('span');
									span.innerHTML = `
										변경된 비밀번호는 <strong>${win}</strong> 입니다.<br>
										로그인 페이지로 이동하려면 아래 버튼을 클릭하세요.
									`;
									findedPwd.appendChild(span);
									document.querySelector('.confirm-ok').style.display = 'block';
								}
	                        });
	                    } else {
	                        document.querySelector('.sms-error').style.display = 'block';
	                    };
	                });
	            };
	        }
	    });	
	}
};

// 인증코드 이벤트 hook
codeBtn.addEventListener('click', getCode);
 /* signupForm javascript start */

  /* 이메일 인증 활성화 */
  const emailForm = document.querySelector('.signup-form.email'); // 이메일 입력폼
  const emailErr = document.querySelector('.validation.email'); // 이메일 오류메세지
  const emailAuthBtn = document.querySelector('.email-auth-btn'); // 이메일 인증요청 버튼
  const emailAuthForm = document.querySelector('#email-auth-form'); // 이메일 인증 박스
  const emailAuthTimer = document.querySelector('.email-auth-time'); // 이메일 인증 타이머
  const submitAuthBtn = document.querySelector('.submit-auth-btn'); // 이메일 인증키 확인 버튼
  const authCodeForm = document.querySelector('.signup-form.auth'); // 이메일 인증키 입력폼
  const authErr = document.querySelector('.validation.auth'); // 이메일 인증 오류메시지
  const pwd1Form = document.querySelector('.signup-form.pwd1'); // 비번 입력폼
  const pwd1Err = document.querySelector('.validation.pwd1'); // 비번 입력 에러 메시지
  const pwd2Form = document.querySelector('.signup-form.pwd2'); // 비번 재확인 입력폼
  const pwd2Err = document.querySelector('.validation.pwd2'); // 비번 재확인 에러 메시지
  const nameForm = document.querySelector('.signup-form.name'); // 이름 입력폼
  const nameErr = document.querySelector('.validation.name'); // 이름 입력 에러메시지
  const birthYearForm = document.querySelector('.signup-form.year'); // 생년 입력폼
  const birthMonthForm = document.querySelector('.signup-form.month'); // 월 입력폼
  const birthDateForm = document.querySelector('.signup-form.date'); // 일 입력폼
  const birthErr = document.querySelector('.validation.birth'); // 생년 에러메시지
  const tel1Form = document.querySelector('.signup-form.tel1'); // 전번1 입력폼
  const tel2Form = document.querySelector('.signup-form.tel2'); // 전번2 입력폼
  const telErr = document.querySelector('.validation.tel'); // 전번 에러메시지
  const postcodeForm = document.querySelector('.signup-form.postcode'); // 우편번호 입력폼
  const postcodeErr = document.querySelector('.validation.postcode'); // 우편번호 에러 메시지
  const addr1Form = document.querySelector('.signup-form.addr1'); // 주소1 입력폼
  const addr1Err = document.querySelector('.validation.addr1'); // 주소1 에러 메시지
  const addr2Form = document.querySelector('.signup-form.addr2'); // 주소2 입력폼
  const submitBtn = document.querySelector('.signform-btn'); // 회원가입 버튼

  let isAuthenticated = false; // 인증 여부
  let countdown; // 카운트다운
  let code; // 인증코드
  
  let csrfTokenValue = $("meta[name='_csrf']").attr("content");
  let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

  // 이메일 유효성 검사
  const emailFormCheck = (e) => {
    let value = e.target.value;
    const emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if (value === '') {
      emailForm.style.border = '2px solid red';
      emailErr.innerHTML = '이메일 주소 입력란이 비어있습니다';
      emailErr.style.display = 'block';
      emailAuthBtn.disabled = true;
    } else if (!emailPattern.test(value)) {
      emailForm.style.border = '2px solid red';
      emailErr.innerHTML = '';
      emailErr.innerHTML = '이메일 주소가 올바르지 않습니다';
      emailErr.style.display = 'block';
	  emailAuthBtn.disabled = true;
    } else {
      emailForm.style.border = '1px solid #ccc';
      const email = $(".signup-form.email").val();
      
      $(document).ajaxSend(function(e, xhr, options) { 
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
      }); 
      
	  $.ajax({
		type: "POST",
		url: "/emailDupCheck",	
		headers: {
           "Content-Type": "application/json"
        },
		data: email,
		dataType: "text",
		success: function(result) {
			if(result === "OK") {
				emailAuthBtn.disabled = false;					
				emailForm.style.border = '2px solid green';
				$(".validation.email").html("<p style='color:green;'>사용 가능한 이메일 입니다.</p>");	
			} else {
				emailAuthBtn.disabled = true;					
				emailForm.style.border = '2px solid red';
				$(".validation.email").html("<p style='color:red;'>이메일이 중복됩니다.</p>");						
			}
		},
		error: function() {
			alert("통신실패");
		}
	  });
    };
  };
  
  // 인증번호 유효성 검사
  const authFormCheck = (e) => {
    let value = e.target.value;
    const authCodePattern = /[0123456789]{6}/;

    if (value === '') {
      authCodeForm.style.border = '2px solid red';
      authErr.innerHTML = '인증번호 입력란이 비어있습니다';
      authErr.style.display = 'block';
    } else if (!authCodePattern.test(value)) {
      authCodeForm.style.border = '2px solid red';
      authErr.innerHTML = '';
      authErr.innerHTML = '인증번호가 올바르지 않습니다';
      authErr.style.display = 'block';
    } else {
      authCodeForm.style.border = '1px solid #ccc';
      authErr.style.display = 'none';
      submitAuthBtn.disabled = false;
    };
    activateSubmitBtn();
  };
  
  // 남은 시간 표시 함수
  const displayTimeLeft = (seconds) => {
    const minutes = Math.floor(seconds / 60);
    const reminderSeconds = seconds % 60;
    const display = `${minutes}:${
      reminderSeconds < 10 ? '0' : ''
    }${reminderSeconds}`;
    emailAuthTimer.textContent = display;
  };

  // 타이머 함수
  const timer = (seconds) => {
    const now = Date.now();
    const then = now + seconds * 1000;

    clearInterval(countdown);
    displayTimeLeft(seconds);

    countdown = setInterval(() => {
      const secondsLeft = Math.round((then - Date.now()) / 1000);

      if (secondsLeft <= 0) {
        clearInterval(countdown);
        emailAuthForm.style.display = 'none';
        emailAuthTimer.textContent = '시간초과';
        emailAuthBtn.disabled = false;
        alert('시간 초과\n버튼을 다시 눌러주세요');
        return;
      };

      displayTimeLeft(secondsLeft);
    }, 1000);
  };

  // 타이머 시작 함수
  const startTimer = () => {
    emailAuthBtn.disabled = true;
    const seconds = 180;
    timer(seconds);
  };

  /* 인증번호 이메일 전송 */
  $(emailAuthBtn).click(function() {
	let email = $(emailForm).val(); // 입력한 이메일 
	$.ajax({

		type : "GET",
		url : "emailCheck?email=" + email,
		success:function(data){
            emailForm.style.border = '1px solid #ccc';
    		emailErr.style.display = 'none';
            $(emailAuthForm).css("display","block");
			alert('인증번호 전송 완료\n이메일의 인증번호를 확인해주세요.');
			startTimer();
			$(authCodeForm).focus();
			code = data;
        }
	});
  });
  
  // 인증번호 확인 버튼 핸들러
  const submitAuthBtnHandler = (e) => {

	if(authCodeForm.value === code) {
		isAuthenticated = true;
		code = '';
	} else {
		isAuthenticated = false;
	}
    
    if (!isAuthenticated) {
      alert('인증번호 인증 실패');
      return;
    } else {
      alert('인증번호 인증 성공');
	  clearInterval(countdown);
      emailAuthForm.style.display = 'none';
      pwd1Form.focus();
    };
  };

  // 비밀번호1 유효성 검사
  const pwd1FormCheck = (e) => {
    const pwd1Pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    let value = e.target.value;

    if (value === '') {
      pwd1Form.style.border = '2px solid red';
      pwd1Err.innerHTML = '비밀번호 입력란이 비어있습니다';
      pwd1Err.style.display = 'block';
    } else if (!pwd1Pattern.test(value)) {
      pwd1Form.style.border = '2px solid red';
      pwd1Err.innerHTML = '';
      pwd1Err.innerHTML =
        '영문,숫자,특수문자를 포함한 8~16자리 비밀번호가 아닙니다';
      pwd1Err.style.display = 'block';
    } else {
      pwd1Form.style.border = '1px solid #ccc';
      pwd1Err.style.display = 'none';
    };
    activateSubmitBtn();
  };

  // 비밀번호2 유효성 검사
  const pwd2FormCheck = (e) => {
    const pwd1 = pwd1Form.value;
    let value = e.target.value;

    if (value === '') {
      pwd2Form.style.border = '2px solid red';
      pwd2Err.innerHTML = '비밀번호 입력란이 비어있습니다';
      pwd2Err.style.display = 'block';
    } else if (value !== pwd1) {
      pwd2Form.style.border = '2px solid red';
      pwd2Err.innerHTML = '';
      pwd2Err.innerHTML = '비밀번호가 일치하지 않습니다';
      pwd2Err.style.display = 'block';
    } else {
      pwd2Form.style.border = '1px solid #ccc';
      pwd2Err.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 이름 유효성 검사
  const nameFormCheck = (e) => {
    const value = e.target.value;
    const namePattern = /[a-zA-Z가-힣]/;

    if (value === '') {
      nameForm.style.border = '2px solid red';
      nameErr.innerHTML = '이름 입력란이 비어있습니다';
      nameErr.style.display = 'block';
    } else if (!namePattern.test(value)) {
      nameForm.style.border = '2px solid red';
      nameErr.innerHTML = '';
      nameErr.innerHTML = '이름이 올바르지 않습니다';
      nameErr.style.display = 'block';
    } else {
      nameForm.style.border = '1px solid #ccc';
      nameErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 출생년도 유효성 검사
  const birthYearFormCheck = (e) => {
    const value = e.target.value;
    const yearPattern = /^(19|20)[0-9]{2}$/;

    if (value === '') {
      birthYearForm.style.border = '2px solid red';
      birthErr.innerHTML = '출생년도 입력란이 비어있습니다';
      birthErr.style.display = 'block';
    } else if (!yearPattern.test(value)) {
      birthYearForm.style.border = '2px solid red';
      birthErr.innerHTML = '';
      birthErr.innerHTML = '출생년도가 올바르지 않습니다';
      birthErr.style.display = 'block';
    } else {
      birthYearForm.style.border = '1px solid #ccc';
      birthErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 생년월일 유효성 검사(월)
  const birthMonthFormCheck = (e) => {
    const value = birthMonthForm.options[birthMonthForm.selectedIndex].text;

    if (value === '월') {
      birthMonthForm.style.border = '2px solid red';
      birthErr.innerHTML = '1~12의 숫자를 선택해주세요';
      birthErr.style.display = 'block';
    } else {
      birthMonthForm.style.border = '1px solid #ccc';
      birthErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 생년월일 유효성 검사(일)
  const birthDateFormCheck = (e) => {
    const value = e.target.value;
    const datePattern = /^[0-9].{0,1}$/;

    if (value === '') {
      birthDateForm.style.border = '2px solid red';
      birthErr.innerHTML = '날짜 입력란이 비어있습니다';
      birthErr.style.display = 'block';
    } else if (!datePattern.test(value)) {
      birthDateForm.style.border = '2px solid red';
      birthErr.innerHTML = '';
      birthErr.innerHTML = '날짜가 올바르지 않습니다';
      birthErr.style.display = 'block';
    } else {
      birthDateForm.style.border = '1px solid #ccc';
      birthErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 전화번호 유효성 검사(앞)
  const tel1FormCheck = (e) => {
    const value = e.target.value;
    const telPattern = /^[0-9]{4}$/;

    if (value === '') {
      tel1Form.style.border = '2px solid red';
      telErr.innerHTML = '전화번호 입력란이 비어있습니다';
      telErr.style.display = 'block';
    } else if (!telPattern.test(value)) {
      tel1Form.style.border = '2px solid red';
      telErr.innerHTML = '';
      telErr.innerHTML = '전화번호가 올바르지 않습니다';
      telErr.style.display = 'block';
    } else {
      tel1Form.style.border = '1px solid #ccc';
      telErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 전화번호 유효성 검사(뒤)
  const tel2FormCheck = (e) => {
    const value = e.target.value;
    const telPattern = /^[0-9]{4}$/;

    if (value === '') {
      tel2Form.style.border = '2px solid red';
      telErr.innerHTML = '전화번호 입력란이 비어있습니다';
      telErr.style.display = 'block';
    } else if (!telPattern.test(value)) {
      tel2Form.style.border = '2px solid red';
      telErr.innerHTML = '';
      telErr.innerHTML = '전화번호가 올바르지 않습니다';
      telErr.style.display = 'block';
    } else {
      tel2Form.style.border = '1px solid #ccc';
      telErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  emailForm.addEventListener('keyup', emailFormCheck);
  emailForm.addEventListener('blur', emailFormCheck);
  emailForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  authFormCheck(e);
	};		
  });
/*  emailAuthBtn.addEventListener('click', emailAuthHandler);*/
  authCodeForm.addEventListener('keyup', authFormCheck);
  authCodeForm.addEventListener('blur', authFormCheck);
  authCodeForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  emailFormCheck(e);
	};		
  });
  submitAuthBtn.addEventListener('click', submitAuthBtnHandler);
  pwd1Form.addEventListener('keyup', pwd1FormCheck);
  pwd1Form.addEventListener('blur', pwd1FormCheck);
  pwd1Form.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  pwd1FormCheck(e);
	};		
  });
  pwd2Form.addEventListener('keyup', pwd2FormCheck);
  pwd2Form.addEventListener('blur', pwd2FormCheck);
  pwd2Form.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  pwd2FormCheck(e);
	};		
  });
  nameForm.addEventListener('keyup', nameFormCheck);
  nameForm.addEventListener('blur', nameFormCheck);
  nameForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  nameFormCheck(e);
	};		
  });
  birthYearForm.addEventListener('keyup', birthYearFormCheck);
  birthYearForm.addEventListener('blur', birthYearFormCheck);
  birthYearForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  birthYearFormCheck(e);
	};		
  });
  birthMonthForm.addEventListener('change', birthMonthFormCheck);
  birthMonthForm.addEventListener('blur', birthMonthFormCheck);
  birthMonthForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  birthMonthFormCheck(e);
	};		
  });
  birthDateForm.addEventListener('keyup', birthDateFormCheck);
  birthDateForm.addEventListener('blur', birthDateFormCheck);
  birthDateForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  birthDateFormCheck(e);
	};		
  });
  tel1Form.addEventListener('keyup', tel1FormCheck);
  tel1Form.addEventListener('blur', tel1FormCheck);
  tel1Form.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  tel1FormCheck(e);
	};		
  });
  tel2Form.addEventListener('keyup', tel2FormCheck);
  tel2Form.addEventListener('blur', tel2FormCheck);
  tel2Form.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  tel2FormCheck(e);
	};		
  });

  /* 우편번호 검색 */
  const postSearch = document.querySelector('.post-search');

  function daumPostcode() {
    new daum.Postcode({
      oncomplete: (data) => {
        // 검색 결과 클릭시 실행할 코드 작성

        let addr = ''; // 주소 변수

        // 사용자가 선택한 주소 타입에 따라 주소값을 가져옴
        if (data.userSelectedType === 'R') {
          // 도로명 주소
          addr = data.roadAddress;
        } else {
          // 지번 주소
          addr = data.jibunAddress;
        }

        // 우편번호와 주소 삽입
        postcodeForm.value = data.zonecode;
        postcodeFormCheck();
        addr1Form.value = addr;
        addr1FormCheck();
        addr2Form.focus();
      },
    }).open();
  }

  // 우편번호 유효성 검사
  const postcodeFormCheck = () => {
    const value = postcodeForm.value;
    const postcodePattern = /^[0-9]{5}$/;

    if (value === '') {
      postcodeForm.style.border = '2px solid red';
      postcodeErr.innerHTML = '우편번호 검색 버튼을 눌러주세요';
      postcodeErr.style.display = 'block';
    } else if (!postcodePattern.test(value)) {
      postcodeForm.style.border = '2px solid red';
      postcodeErr.innerHTML = '';
      postcodeErr.innerHTML = '우편번호가 올바르지 않습니다';
      postcodeErr.style.display = 'block';
    } else {
      postcodeForm.style.border = '1px solid #ccc';
      postcodeErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 주소 유효성 검사
  const addr1FormCheck = () => {
    const value = addr1Form.value;

    if (value === '') {
      addr1Form.style.border = '2px solid red';
      addr1Err.innerHTML = '주소 입력란이 비어있습니다';
      addr1Err.style.display = 'block';
    } else {
      addr1Form.style.border = '1px solid #ccc';
      addr1Err.style.display = 'none';
    }
    activateSubmitBtn();
  };

  postSearch.addEventListener('click', daumPostcode);
  postcodeForm.addEventListener('click', postcodeFormCheck);
  postcodeForm.addEventListener('keyup', postcodeFormCheck);
  postcodeForm.addEventListener('blur', postcodeFormCheck);
  postcodeForm.addEventListener('change', postcodeFormCheck);
  postcodeForm.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  postcodeFormCheck(e);
	};		
  });
  addr1Form.addEventListener('click', addr1FormCheck);
  addr1Form.addEventListener('keydown', (e) => {
	if(e.keyCode === 8) {
  	  addr1FormCheck(e);
	};		
  });

  // 회원가입 버튼 활성화
  const activateSubmitBtn = () => {
    if (
      isAuthenticated &&
      emailErr.style.display === 'none' &&
      pwd1Err.style.display === 'none' &&
      pwd2Err.style.display === 'none' &&
      nameErr.style.display === 'none' &&
      birthErr.style.display === 'none' &&
      telErr.style.display === 'none' &&
      postcodeErr.style.display === 'none' &&
      addr1Err.style.display === 'none'
    ) {
      submitBtn.disabled = false;
    }
  };

  const submitBtnHandler = (e) => {
    //이메일
	const email = $(".signup-form.email").val();
	//패스워드
	const password = $(".signup-form.pwd1").val();
	//이름
	const name = $(".signup-form.name").val();
	// 생년월일
	const birth = $(".signup-form.year").val() + "-" + $(".signup-form.month").val() + "-" + $(".signup-form.date").val();
	const birthDate = new Date(birth);
	// 핸드폰 번호
	const phone = $(".signup-form.agency").val() + $(".signup-form.tel1").val() + $(".signup-form.tel2").val();
	// 주소
	const postcode = $(".signup-form.postcode").val();
	const address =  $(".signup-form.addr1").val() + "-" + $(".signup-form.addr2").val();
	
	const member = {
		memberEmail: email,
		memberPassword: password,
		memberName: name,
		memberBirth: birthDate,
		memberPhone: phone,
		memberPostcode: postcode,
		memberAddress: address,
		platFormType: 'Toosome'
	};
	
	//클라이언트에서 서버와 통신하는 ajax함수(비동기 통신) 
	$.ajax({
		type: "POST", //서버에 전송하는 HTTP요청 방식
		url: "/signup", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		data: JSON.stringify(member), //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			
			if(result === "success") {
				alert("회원가입에 성공했습니다!");
				location.href="/signupcomplete";
			} else {
				alert("회원가입에 실패했습니다!");
				location.href="/signup";
			}
		}, 
		error: function() {
			alert("통신 실패");
		} 
	});
  };

  submitBtn.addEventListener('click', submitBtnHandler);

  /* signupForm javascript end */


		
		

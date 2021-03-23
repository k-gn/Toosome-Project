$(function () {
  /* nav jquery start */
  $('#container header').mouseover(function () {
    // $(this).css("background-color", "#38383b");
    $(this).addClass('on');
  });
  $('#container header').mouseleave(function () {
    $(this).removeClass('on');
  });
  $('.nav > .menu-title').mouseover(function () {
    $('header .full-cover').stop().fadeIn(300);
    $('.nav > .menu-title > .sub-con').stop().fadeIn(400);
  });
  $('.nav > .menu-title').mouseleave(function () {
    $('header .full-cover').stop().fadeOut(300);
    $('.nav > .menu-title > .sub-con').stop().fadeOut(400);
  });

  $('.button-logo a.offbutton').click(function () {
    $(this).css('display', 'none');
    $('.button-logo a.onbutton').css('display', 'block');
    $('.button-bar').stop().animate(
      {
        top: 0,
      },
      1000
    );

    return false;
  });
  /* nav jquery end */

  /* fixed-btn jquery start */
  $('.button-logo a.onbutton').click(function () {
    $(this).css('display', 'none');
    $('.button-logo a.offbutton').css('display', 'block');
    $('.button-bar').stop().animate(
      {
        top: '100%',
      },
      1000
    );
    return false;
  });

  $(document).click(function () {
    $('.button-logo a.onbutton').css('display', 'none');
    $('.button-logo a.offbutton').css('display', 'block');
    $('.button-bar').stop().animate(
      {
        top: '100%',
      },
      1000
    );
    return false;
  });

  /* signupForm javascript start */

  /* 이메일 인증 활성화 */
  const emailForm = document.querySelector('.signup-form.email');
  const emailErr = document.querySelector('.validation.email');
  const emailAuthBtn = document.querySelector('.email-auth-btn');
  const emailAuthForm = document.querySelector('#email-auth-form');
  const emailAuthTimer = document.querySelector('.email-auth-time');
  const submitAuthBtn = document.querySelector('.submit-auth-btn');
  const authCodeForm = document.querySelector('.signup-form.auth');
  const authErr = document.querySelector('.validation.auth');
  const pwd1Form = document.querySelector('.signup-form.pwd1');
  const pwd1Err = document.querySelector('.validation.pwd1');
  const pwd2Form = document.querySelector('.signup-form.pwd2');
  const pwd2Err = document.querySelector('.validation.pwd2');
  const nameForm = document.querySelector('.signup-form.name');
  const nameErr = document.querySelector('.validation.name');
  const birthYearForm = document.querySelector('.signup-form.year');
  const birthMonthForm = document.querySelector('.signup-form.month');
  const birthDateForm = document.querySelector('.signup-form.date');
  const birthErr = document.querySelector('.validation.birth');
  const tel1Form = document.querySelector('.signup-form.tel1');
  const tel2Form = document.querySelector('.signup-form.tel2');
  const telErr = document.querySelector('.validation.tel');
  const postcodeForm = document.querySelector('.signup-form.postcode');
  const postcodeErr = document.querySelector('.validation.postcode');
  const addr1Form = document.querySelector('.signup-form.addr1');
  const addr1Err = document.querySelector('.validation.addr1');
  const addr2Form = document.querySelector('.signup-form.addr2');
  const submitBtn = document.querySelector('.signform-btn');
  const signupForm = document.querySelector('.signup-form-container');

  let isAuthenticated = true; // 인증 여부
  let countdown; // 카운트다운

  // 이메일 유효성 검사
  const emailFormCheck = (e) => {
    e.preventDefault();
    let value = e.target.value;
    const emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if (value === '') {
      emailForm.style.border = '2px solid red';
      emailErr.innerHTML = '이메일 주소 입력란이 비어있습니다';
      emailErr.style.display = 'block';
    } else if (!emailPattern.test(value)) {
      emailForm.style.border = '2px solid red';
      emailErr.innerHTML = '';
      emailErr.innerHTML = '이메일 주소가 올바르지 않습니다';
      emailErr.style.display = 'block';
    } else {
      emailForm.style.border = '1px solid #ccc';
      emailErr.style.display = 'none';
      emailAuthBtn.disabled = false;
    }
  };

  // 인증번호 유효성 검사
  const authFormCheck = (e) => {
    e.preventDefault();
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
    }
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
      }

      displayTimeLeft(secondsLeft);
    }, 1000);
  };

  // 타이머 시작 함수
  const startTimer = () => {
    emailAuthBtn.disabled = true;
    const seconds = 180;
    timer(seconds);
  };

  // 이메일 인증 버튼 핸들러
  const emailAuthHandler = (e) => {
    e.preventDefault();
    alert('인증번호 전송 완료');
    emailAuthForm.style.display = 'block';
    startTimer();
    authCodeForm.focus();
  };

  // 인증번호 확인 버튼 핸들러
  const submitAuthBtnHandler = (e) => {
    e.preventDefault();

    /*
      서버와 인증번호 대조 코드 입력
    */
    if (!isAuthenticated) {
      alert('인증번호 인증 실패');
      return;
    } else {
      alert('인증번호 인증 성공');
      emailAuthForm.style.display = 'none';
      pwd1Form.focus();
    }
  };

  // 비밀번호1 유효성 검사
  const pwd1FormCheck = (e) => {
    e.preventDefault();
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
    }
    activateSubmitBtn();
  };

  // 비밀번호2 유효성 검사
  const pwd2FormCheck = (e) => {
    e.preventDefault();
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
    e.preventDefault();
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
    e.preventDefault();
    const value = e.target.value;
    const yearPattern = /^(19|20)\d{2}/;

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
      birthMonthForm.focus();
    }
    activateSubmitBtn();
  };

  // 생년월일 유효성 검사(월)
  const birthMonthFormCheck = (e) => {
    e.preventDefault();
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
    e.preventDefault();
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
    e.preventDefault();
    const value = e.target.value;
    const telPattern = /^[0-9].{0,3}$/;

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
    e.preventDefault();
    const value = e.target.value;
    const telPattern = /^[0-9].{0,3}$/;

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
  emailAuthBtn.addEventListener('click', emailAuthHandler);
  authCodeForm.addEventListener('keyup', authFormCheck);
  authCodeForm.addEventListener('blur', authFormCheck);
  submitAuthBtn.addEventListener('click', submitAuthBtnHandler);
  pwd1Form.addEventListener('keyup', pwd1FormCheck);
  pwd1Form.addEventListener('blur', pwd1FormCheck);
  pwd2Form.addEventListener('keyup', pwd2FormCheck);
  pwd2Form.addEventListener('blur', pwd2FormCheck);
  nameForm.addEventListener('keyup', nameFormCheck);
  nameForm.addEventListener('blur', nameFormCheck);
  birthYearForm.addEventListener('keyup', birthYearFormCheck);
  birthYearForm.addEventListener('blur', birthYearFormCheck);
  birthMonthForm.addEventListener('change', birthMonthFormCheck);
  birthMonthForm.addEventListener('blur', birthMonthFormCheck);
  birthDateForm.addEventListener('keyup', birthDateFormCheck);
  birthDateForm.addEventListener('blur', birthDateFormCheck);
  tel1Form.addEventListener('keyup', tel1FormCheck);
  tel1Form.addEventListener('blur', tel1FormCheck);
  tel2Form.addEventListener('keyup', tel2FormCheck);
  tel2Form.addEventListener('blur', tel2FormCheck);

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
    const postcodePattern = /^[0-9].{0,4}$/;

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
  addr1Form.addEventListener('click', addr1FormCheck);

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
    alert('회원가입 성공');
    signupForm.submit();
  };

  submitBtn.addEventListener('click', submitBtnHandler);

  /* signupForm javascript end */
});
/* fixed-btn jquery end */

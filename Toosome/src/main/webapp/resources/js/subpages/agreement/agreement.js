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

  /* signup javascript start */
  const allBtn = document.querySelector('.sign-all-btn'); // 전체동의 버튼
  const btns = document.querySelectorAll('.sign-each-btn'); // 나머지 버튼들
  const signupBtn = document.querySelector('.signup-btn'); // 회원가입 버튼
  const signupInfo = document.querySelector('.signup-info'); // 경고 문구

  // 전체동의 체크 확인여부
  let allChecked = false;

  // check or uncheck All
  const checkAll = () => {
    if (allChecked) {
      btns.forEach((btn) => {
        btn.classList.add('checked');
      });
    } else {
      btns.forEach((btn) => {
        btn.classList.remove('checked');
      });
    }
  };

  // 전체 동의 버튼 핸들러
  const allBtnHandler = (e) => {
    allBtn.classList.toggle('checked');
    if (allBtn.classList.contains('checked')) {
      allChecked = true;
      checkAll();
      enableSignupBtn();
    } else {
      allChecked = false;
      checkAll();
      enableSignupBtn();
    }
  };

  // 필수 동의 버튼 핸들러
  const eachBtnHandler = (index) => {
    if (allChecked) {
      allChecked = false;
      checkAll();
      allBtn.classList.remove('checked');
      enableSignupBtn();
    } else {
      btns[index].classList.toggle('checked');
      enableSignupBtn();
    }
  };

  // 회원가입 버튼 활성화
  const enableSignupBtn = () => {
    if (
      btns[0].classList.contains('checked') &&
      btns[1].classList.contains('checked')
    ) {
      signupBtn.disabled = false;
      signupInfo.style.display = 'none';
    } else {
      signupBtn.disabled = true;
      signupInfo.style.display = 'block';
    }
  };

  // 선택 동의 버튼 핸들러
  const choiceBtnHandler = (e) => {
    btns[btns.length - 1].classList.toggle('checked');
  };

  // 회원가입 버튼 핸들러
  const signupHandler = (e) => {
    if (!signupBtn.disabled) {
      alert('회원가입 진행');
    }
  };

  // event hook
  allBtn.addEventListener('click', allBtnHandler);
  for (let i = 0; i < btns.length - 1; i++) {
    btns[i].addEventListener('click', () => eachBtnHandler(i));
  }
  btns[btns.length - 1].addEventListener('click', choiceBtnHandler);
  signupBtn.addEventListener('click', signupHandler);

  /* signup javascript end */
});
/* fixed-btn jquery end */

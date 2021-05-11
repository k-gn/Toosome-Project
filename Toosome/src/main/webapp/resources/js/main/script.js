$(function () {
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

  // popup 창
  $("#notice_wrap").draggable({
	  /* axis:"y" y축으로만 옮기기가능(지울경우 축 고정없이 어디든 옮기기 가능) */
	}); //드래그해서 옮기기가 가능한 실행문
	
	if($.cookie("popup")=="none"){
		// 3일동안 이 내용을 열지않기 버튼 클릭 후에 해당 페이지를 열었을 때
		$("#notice_wrap").css("display","none");
	}
	
	var chkbox =$("#expiresChk");
	
	//변수 chkbox에 input#expiresChk저장
	
	$('.closeBtn').click(function(){
		closePop();
	});
	
	//닫기 버튼 클릭시 아래 closePop실행
	
	function closePop(){
		if(chkbox.is(":checked")){
			//체크박스에 체크가 되어있을 때
			$.cookie("popup","none",{expires:3});
			//쿠키함수(팝업, none, {3일동안})
			
		}
		
		
		$("#notice_wrap").fadeOut("fast");
	}



  // 배너 이미지 슬라이드
  $('.img-slide').mousewheel(function (event, d) {
    var i = $(this).index();
    if (d > 0) {
      if (i == 0) return;
      var off = $(this).prev().offset().top;
    } else if (d < 0) {
      if (i == 2) return;
      var off = $(this).next().offset().top;
    }

    $('html,body').stop().animate(
      {
        scrollTop: off,
      },
      1200
    );
  });

  // 신상메뉴 이미지 슬라이드
  $('.autoplay').slick({
    dots: true,
    infinite: true,
    speed: 1300,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
  });

	$(".autoplay2").slick({
	    dots: false,
	    infinite: true,
	    speed: 1000,
	    slidesToShow: 4,
	    slidesToScroll: 1,
	    autoplay: true,
	    autoplaySpeed: 2000,
		
		responsive: [ // 반응형 웹 구현
			{
				breakpoint: 1480, // 화면 사이즈 1480px
				settings: {
					slidesToShow: 3
				}
			},
			{
				breakpoint: 1135, // 화면 사이즈 1135px
				settings: {
					slidesToShow: 2
				}
			},
			{
				breakpoint: 770, // 화면 사이즈 770px
				settings: {
					slidesToShow: 1
				}
			}
		]
	});


  // section image slide start------------------------------------------------------------

  const quickCoffee = document.querySelector('.quick-menu-coffee');
  const quickBeverage = document.querySelector('.quick-menu-beverage');

  // debouncer
  function debounce(func, wait = 20, immediate = true) {
    var timeout;
    return function () {
      var context = this,
        args = arguments;
      var later = function () {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  }

  // slide effect
  const hookSlideEffect = (element) => {
    // 스크롤바 절대 위치 - 요소 1/2 위치
    const slideInAt =
      window.scrollY + window.innerHeight - element.offsetHeight / 2;
    // 이미지 상단 절대 위치
    const imageTop = window.scrollY + element.getBoundingClientRect().top;
    // 이미지 하단 절대 위치
    const imageBottom = window.scrollY + element.getBoundingClientRect().bottom;
    // slideInAt이 각 이미지의 상단보다 클때
    const isHalfShown = slideInAt > imageTop;
    // 현재 스크롤된 위치가 이미지 하단보다 작을때
    const isNotScrolledPast = window.scrollY < imageBottom;
    if (isHalfShown && isNotScrolledPast) {
      element.classList.add('active');
    } else {
      element.classList.remove('active');
    }
  };

  // add event
  const checkSlide = (e) => {
    hookSlideEffect(quickCoffee);
    hookSlideEffect(quickBeverage);
  };

  window.addEventListener('scroll', debounce(checkSlide));

  // section image slide end------------------------------------------------------------
  
  // admin login
  const pressed = [];
  const code = 'dltmdwotjstodsla';

  window.addEventListener('keyup', (e) => {
	pressed.push(e.key);
	pressed.splice(-code.length - 1, pressed.length - code.length);
	if(pressed.join('').includes(code)) {
		document.getElementById('login').href = '/admin/signin';
	};
  });
});

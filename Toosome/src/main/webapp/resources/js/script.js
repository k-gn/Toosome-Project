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

  var newClone = $('#new-menu .img_box .new-menu-box li:lt(6)').clone();
  $('#new-menu .img_box .new-menu-box').append(newClone);

  var rep;
  var h = 0;
  timer2();

  function timer2() {
    rep = setInterval(function () {
      if (h == 26) {
        h = 0;
        $('#new-menu .img_box .new-menu-box').css('margin-left', 0);
      }
      h++;
      $('#new-menu .img_box .new-menu-box')
        .stop()
        .animate(
          {
            'margin-left': -h * 25 + '%',
          },
          600
        );
    }, 3000);
  }

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
});
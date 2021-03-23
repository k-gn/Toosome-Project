$(function () {
  $("#container header").mouseover(function () {
    // $(this).css("background-color", "#38383b");
    $(this).addClass("on");
  });
  $("#container header").mouseleave(function () {
    $(this).removeClass("on");
  });
  $(".nav > .menu-title").mouseover(function () {
    $("header .full-cover").stop().fadeIn(300);
    $(".nav > .menu-title > .sub-con").stop().fadeIn(400);
  });
  $(".nav > .menu-title").mouseleave(function () {
    $("header .full-cover").stop().fadeOut(300);
    $(".nav > .menu-title > .sub-con").stop().fadeOut(400);
  });

  // 이미지 슬라이드
  $(".autoplay").slick({
    dots: true,
    infinite: true,
    speed: 1300,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
  });

  var newClone = $("#new-menu .img_box .new-menu-box li:lt(6)").clone();
  $("#new-menu .img_box .new-menu-box").append(newClone);

  var rep;
  var h = 0;
  timer2();

  function timer2() {
    rep = setInterval(function () {
      if (h == 26) {
        h = 0;
        $("#new-menu .img_box .new-menu-box").css("margin-left", 0);
      }
      h++;
      $("#new-menu .img_box .new-menu-box")
        .stop()
        .animate(
          {
            "margin-left": -h * 25 + "%",
          },
          600
        );
    }, 3000);
  }

  $(".button-logo a.offbutton").click(function () {
    $(this).css("display", "none");
    $(".button-logo a.onbutton").css("display", "block");
    $(".button-bar").stop().animate(
      {
        top: 0,
      },
      1000
    );

    return false;
  });

  $(".button-logo a.onbutton").click(function () {
    $(this).css("display", "none");
    $(".button-logo a.offbutton").css("display", "block");
    $(".button-bar").stop().animate(
      {
        top: "100%",
      },
      1000
    );
    return false;
  });

  $(document).click(function () {
    $(".button-logo a.onbutton").css("display", "none");
    $(".button-logo a.offbutton").css("display", "block");
    $(".button-bar").stop().animate(
      {
        top: "100%",
      },
      1000
    );
    return false;
  });

  $(window).scroll(function () {
    var sct = $(window).scrollTop();
    var off = $(".section").offset().top;

    if (sct >= off) {
      $(".section .quick-menu .coffee-ment").stop().delay(1200).animate(
        {
          right: "20%",
        },
        1600
      );
      $(".section .quick-menu .beverage-ment").stop().delay(1600).animate(
        {
          right: "20%",
        },
        1600
      );
      $(".section .quick-menu .coffee").stop().animate(
        {
          left: "20%",
        },
        1600
      );
      $(".section .quick-menu .beverage").stop().animate(
        {
          left: "20%",
        },
        1600
      );
    }
  });
});

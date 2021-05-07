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

  /*$(document).click(function () {
    $('.button-logo a.onbutton').css('display', 'none');
    $('.button-logo a.offbutton').css('display', 'block');
    $('.button-bar').stop().animate(
      {
        top: '100%',
      },
      1000
    );
    return false;
  });*/

// .kyEsUG
  // menu-bar click
  $(".menu-bar").click(function () {
    $(".menu-bar").toggleClass("mon");
    $("header .mobile-nav").toggleClass("clickNav");
	$(".kyEsUG").toggleClass("zindex");
    return false;
  });

  // mobile-menu click
  $("header .mobile-nav .m-nav > li > a").click(function () {
    var d = $(this).next("ul").css("display");

    if (d == "none") {
      $("header .mobile-nav .m-nav > li > ul").stop().slideUp();
      $(this).next("ul").stop().slideDown();
    } else {
      $(this).next("ul").stop().slideUp();
    }
    return false;
  });


});
/* fixed-btn jquery end */

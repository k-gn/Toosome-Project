$(function () {
  $(".nav > ul > li > a").click(function () {
    var d = $(this).next("ul").css("display");

    if (d == "none") {
      $(".nav>ul>li>ul").stop().slideUp();
      $(this).next("ul").stop().slideDown();
    } else {
      $(this).next("ul").stop().slideUp();
    }

    return false;
  });
});

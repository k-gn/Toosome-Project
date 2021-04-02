$(function () {
  $(".menu-tab li").click(function () {
    var i = $(this).index();

    $(".menu-tab li").removeClass("click");
    $(this).addClass("click");

    $(".product-box ul").css("display", "none");
    $(".product-box ul").eq(i).css("display", "grid");

    return false;
  });
});

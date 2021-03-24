$(function () {
  $(".btn-tab li").click(function () {
    var i = $(this).index();

    $(".btn-tab li").removeClass("select");
    $(this).addClass("select");

    $(".menu-contents .tab-img li").css("display", "none");
    $(".menu-contents .tab-img li").eq(i).css("display", "block");

    return false;
  });
});

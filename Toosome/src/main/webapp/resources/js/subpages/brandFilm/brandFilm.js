$(function () {
  $(".you-thumb-box li").click(function () {
    var i = $(this).index();

    $(".you-thumb-box li").removeClass("box-select");
    $(this).addClass("box-select");

    $(".you-box article").css("display", "none");
    $(".you-box article").eq(i).css("display", "flex");

    return false;
  });
});

$(function () {
  $(".click-way article").click(function () {
    $(".click-way article").removeClass("click-on");
    $(this).addClass("click-on");

    return false;
  });
});

$(function () {
  $(".btn-tab li").click(function () {
    // var w = $(".btn-tab li a").width();
    var i = $(this).index();

    $(".menu-content ul").css("display", "none");
    $(".menu-content ul").eq(i).css("display", "block");

    $(".ani-border")
      .stop()
      .animate(
        {
          left: i * 189.59,
        },
        1300,
        "easeOutElastic"
      );
    return false;
  });
});

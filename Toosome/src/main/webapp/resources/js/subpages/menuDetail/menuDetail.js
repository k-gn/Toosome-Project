$(function () {
  $(".triangle-cover").click(function () {
    $(".star-drop").css("display", "block");
    return false;
  });

  $(".star-drop li").click(function () {
    var i = $(this).index();

    $(".star-catch p").css("display", "none");
    $(".star-catch p").eq(i).css("display", "block");

    $(".star-drop").css("display", "none");
    return false;
  });
});

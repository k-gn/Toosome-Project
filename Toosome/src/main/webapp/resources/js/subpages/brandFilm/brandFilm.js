$(function () {
  $(".btn-tab li").click(function () {
    var i = $(this).index();

    $(".btn-tab li").removeClass("select");
    $(this).addClass("select");

    $(".menu-contents .menu-contents-box").css("display", "none");
    $(".menu-contents .menu-contents-box").eq(i).css("display", "block");
    $(".you-box article").css("display", "none");
    $("#year20 article").eq(0).css("display", "flex");
    $("#year19 article").eq(0).css("display", "flex");
    $("#year22 article").eq(0).css("display", "flex");
    $(".menu-contents-box .you-thumb-box li").removeClass("box-select");
    $(".a1 .you-thumb-box li").eq(0).addClass("box-select");
    $(".a2 .you-thumb-box li").eq(0).addClass("box-select");
    $(".a3 .you-thumb-box li").eq(0).addClass("box-select");

    return false;
  });

  $(".a1 .you-thumb-box li").click(function () {
    var j = $(this).index();

    $(".a1 .you-thumb-box li").removeClass("box-select");
    $(this).addClass("box-select");

    $("#year20 article").css("display", "none");
    $("#year19 article").eq(0).css("display", "flex");
    $("#year22 article").eq(0).css("display", "flex");
    $("#year20 article").eq(j).css("display", "flex");
    return false;
  });

  $(".a2 .you-thumb-box li").click(function () {
    var j = $(this).index();

    $(".a2 .you-thumb-box li").removeClass("box-select");
    $(this).addClass("box-select");

    $("#year19 article").css("display", "none");
    $("#year20 article").eq(0).css("display", "flex");
    $("#year22 article").eq(0).css("display", "flex");
    $("#year19 article").eq(j).css("display", "flex");
    return false;
  });

  $(".a3 .you-thumb-box li").click(function () {
    var j = $(this).index();

    $(".a3 .you-thumb-box li").removeClass("box-select");
    $(this).addClass("box-select");

    $("#year22 article").css("display", "none");
    $("#year19 article").eq(0).css("display", "flex");
    $("#year20 article").eq(0).css("display", "flex");
    $("#year22 article").eq(j).css("display", "flex");
    return false;
  });
});

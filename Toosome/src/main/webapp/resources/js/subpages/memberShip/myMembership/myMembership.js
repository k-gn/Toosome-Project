/**
 * 
 */
var tier = {
  bronze: {
    img: "/resources/img/subpages/member/myMembership/tier/bronze_1.png",
  },
  silver: {
    img: "/resources/img/subpages/member/myMembership/tier/silver_1.png",
  },
  gold: {
    img: "/resources/img/subpages/member/myMembership/tier/gold_1.png",
  },
  platinum: {
    img: "/resources/img/subpages/member/myMembership/tier/platinum_1.png",
  },
  diamond: {
    img: "/resources/img/subpages/member/myMembership/tier/diamond_1.png",
  },
};

$(function () {

  if (point <= 5000) {
    $(".member-tier img").attr("src", tier["bronze"]["img"]);
    $(".progress-bar").attr("style", "width: calc(1/50*" + point + "%)");
    $(".progress-bar").html((1 / 50) * +point + "%");
    $(".pro-text ul .min").html("0" + " p");
    $(".pro-text ul .max").html("5000" + " p");
    $(".info-foot span").html(point);
    $(".minus span").html(5001 - point);
  } else if (point <= 10000) {
    $(".member-tier img").attr("src", tier["silver"]["img"]);
    $(".progress-bar").attr(
      "style",
      "width: calc(1/50*" + (point - 5000) + "%)"
    );
    $(".progress-bar").html((1 / 50) * +(point - 5000) + "%");
    $(".pro-text ul .min").html("5001" + " p");
    $(".pro-text ul .max").html("10000" + " p");
    $(".info-foot span").html(point);
    $(".minus span").html(10001 - point);
  } else if (point <= 15000) {
    $(".member-tier img").attr("src", tier["gold"]["img"]);
    $(".progress-bar").attr(
      "style",
      "width: calc(1/50*" + (point - 10000) + "%)"
    );
    $(".progress-bar").html((1 / 50) * +(point - 10000) + "%");
    $(".pro-text ul .min").html("10001" + " p");
    $(".pro-text ul .max").html("15000" + " p");
    $(".info-foot span").html(point);
    $(".minus span").html(15001 - point);
  } else if (point <= 20000) {
    $(".member-tier img").attr("src", tier["platinum"]["img"]);
    $(".progress-bar").attr(
      "style",
      "width: calc(1/50*" + (point - 15000) + "%)"
    );
    $(".progress-bar").html((1 / 50) * +(point - 15000) + "%");
    $(".pro-text ul .min").html("15001" + " p");
    $(".pro-text ul .max").html("20000" + " p");
    $(".info-foot span").html(point);
    $(".minus span").html(20001 - point);
  } else if (point > 20000) {
    $(".member-tier img").attr("src", tier["diamond"]["img"]);
    $(".progress-bar").attr(
      "style",
      "width: calc(1/50*" + (point - 20000) + "%)"
    );
    $(".progress-bar").html((1 / 50) * +(point - 20000) + "%");
    $(".pro-text ul .min").html("20001" + " p");
    $(".pro-text ul .max").html("∞" + " p");
    $(".info-foot span").html(point);
    $(".minus").html("최고 등급입니다.");
    $(".minus span").css("display", "none");
  }

});
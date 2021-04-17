/**
 * 
 */

var memberInfo = {
  person1: {
    point: 4200,
  },
  person2: {
    point: 7002,
  },
  person3: {
    point: 10200,
  },
  person4: {
    point: 17500,
  },
  person5: {
    point: 28000,
  },
};

var tier = {
  bronze: {
    img: "/resources/img/subpage/member/myMembership/tier/bronze_1.png",
  },
  silver: {
    img: "/resources/img/subpage/member/myMembership/tier/silver_1[1].png",
  },
  gold: {
    img: "/resources/img/subpage/member/myMembership/tier/gold_1[1].png",
  },
  platinum: {
    img: "/resources/img/subpage/member/myMembership/tier/platinum_1[1].png",
  },
  diamond: {
    img: "/resources/img/subpage/member/myMembership/tier/diamond_1[1].png",
  },
};

$(function () {
  var point = memberInfo["person1"]["point"];

  if (point <= 5000) {
    $(".member-tier img").attr("src", tier["bronze"]["img"]);
    $(".progress-bar").attr("style", "width: calc(1/50*" + point + "%)");
    $(".progress-bar").html((1 / 50) * +point + "%");
    $(".pro-text ul .min").html("0" + " p");
    $(".pro-text ul .max").html("5000" + " p");
    $(".info-foot span").html(point);
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
  }
});

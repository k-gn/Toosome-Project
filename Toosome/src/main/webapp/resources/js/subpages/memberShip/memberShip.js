/**
 * 
 */

$(function () {
  $(".check-box-cover").click(function () {
    $(".check-box-cover .check-box").toggleClass("check");
    if ($("#ck-box").is(":checked") == false) {
      $("#ck-box").attr("checked", true);
	  $("#sign").attr("disabled", false);
    } else {
      $("#ck-box").attr("checked", false);
	  $("#sign").attr("disabled", true);
    }
  });
});

let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

$(function () {
  $(document).ajaxSend(function(e, xhr, options) { 
    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
  }); 
	
  $.ajax({
     url: '/membership/minfo',
     type: 'post',
	 headers: {
			"Content-Type": "application/json"
		}, 
     dataType: 'json',
	 data: id,
     success: function (res) {
		 const imgPath = "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/membership/tier/";
		 let point = res.membershipPoint;
		 let level = res.level;
		 if(level.levelMaxRange == null) {
			level.levelMaxRange = level.levelMinRange;
		}
		let tier = imgPath + level.levelImg;
		let mul = 1 / 50;
		let result = 100 - (mul * (level.levelMaxRange - point));
		
        $(".member-tier img").attr("src", tier);
	    $(".pro-text ul .min").html(level.levelMinRange + " p");
		if(level.levelMaxRange != level.levelMinRange) {
			$(".progress-bar").attr(
		      "style", 
		      "width: calc(" + result + "%)"
	        );
		    $(".progress-bar").html(result + "%");
			$(".pro-text ul .max").html(level.levelMaxRange + " p");
		    $(".info-foot span").html(point);
		    $(".minus span").html((level.levelMaxRange+1) - point);
		}else {
			$(".progress-bar").attr(
		      "style", 
		      "width: 100%"
	        );
		    $(".progress-bar").html("100%");
			$(".pro-text ul .max").html("∞");
		    $(".info-foot span").html(point);
		    $(".minus").html("최고 등급입니다.");
		    $(".minus span").css("display", "none");
		}
	 }
   });

});

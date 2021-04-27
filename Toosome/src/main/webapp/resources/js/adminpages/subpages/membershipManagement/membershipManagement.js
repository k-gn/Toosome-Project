let selectLevel = document.getElementById("lvl");
const lvlImgPath = "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/membership/tier/";

function changeLevel() {

	let id = selectLevel.options[selectLevel.selectedIndex].value;
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/level/" + id , //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			let lvlImg = lvlImgPath + res.levelImg;
			$("input[name=id]").val(res.levelId);			
			$("input[name=levelId]").val(res.levelId);			
			$("input[name=levelName]").val(res.levelName);			
			$("input[name=levelMinRange]").val(res.levelMinRange);			
			$("input[name=levelMaxRange]").val(res.levelMaxRange);			
			$("input[name=levelDiscountRate]").val(res.levelDiscountRate);			
			$("input[name=levelPointRate]").val(res.levelPointRate);			
			$("input[name=levelDeliveryPay]").val(res.levelDeliveryPay);			
			$("input[name=levelImg]").val(res.levelImg);			
			$("#lvlImg").attr("src", lvlImg);
			
			$("#lvlForm").attr("action", `/admin/modlvl?${csrfName}=${csrfToken}`);
			$("#lvlBtn").html("업데이트");
			$("input[name=levelName]").focus();
			$("#max").attr("disabled", false);
		}, 
		error: function() {
			$("input[name=id]").val(lid);			
			$("input[name=levelI9d]").val(lid);			
			$("input[name=levelName]").val("");			
			$("input[name=levelMinRange]").val("");			
			$("input[name=levelMaxRange]").val("");			
			$("input[name=levelDiscountRate]").val("");			
			$("input[name=levelPointRate]").val("");			
			$("input[name=levelDeliveryPay]").val("");	
			$("#lvlForm").attr("action", `/admin/addlvl?${csrfName}=${csrfToken}`);
			$("#lvlBtn").html("등록");
			$("#lvlImg").attr("src", "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png");
			$("#max").attr("disabled", true);
		} 
	});
}

$(document).ready(() => {
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/level" , //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			$("#lvl").html("<option value='0'>멤버십 등급</option>");
			res.forEach(function(lvl) {
				$("#lvl").append(`<option value='${lvl.levelId}'>${lvl.levelName}</option>`);
			});	
		}
	});
}); 

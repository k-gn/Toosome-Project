<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>문자 인증</title>
</head>
<body>
	<input class="sms_phone_number_box" type="text" name="phone" placeholder="받는 사람 번호">
	<input class="sms_phone_btn" type="button" value="전송">
	<br />
	<br />
	<input type="text" name="sms" id="sms" placeholder="인증 번호 입력" />
	<button onclick="phoneCheck();">인증</button>
<script>
$(".sms_phone_btn").click(function() {

	var phone_number = $(".sms_phone_number_box").val(); // 입력한 이메일 
	var phone_number_check = "";
	
	$.ajax({

		type : "GET",
		url : "sendSms?phone=" + phone_number,
		success:function(data){
			console.log("data : " + data);
			phone_number_check = data;
        }
	});

});
<%--	function phoneCheck() {
			$.ajax({
				url : "<%=request.getContextPath()%>/smsCheck",
				type : "post",
				data : {
					code : $("#sms").val()
				},
				success : function(result) {
					if (result == "ok") {
						alert("번호 인증 성공");
					} else {
						alert("번호 인증 실패");
					}
				}
			});
		} --%>
	</script>
</body>
</html>

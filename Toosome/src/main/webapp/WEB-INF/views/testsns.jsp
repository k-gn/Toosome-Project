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
	<input type="text" name="phone" id="phone" placeholder="받는 사람 번호" />
	<button onclick="sendSms();">전송</button>
	<br />
	<br />
	<input type="text" name="sms" id="sms" placeholder="인증 번호 입력" />
	<button onclick="phoneCheck();">인증</button>
	<script>
	function sendSms() {
		$.ajax({ 
			url: "<%=request.getContextPath()%>/sendSms",
				data : {
					receiver : $("#phone").val()
				},
				type : "post",
				success : function(result) {
					if (result == "true") {
						console.log(result);
					} else {
						alert("인증번호 전송 실패");
					}
				}
			});
		}
		function phoneCheck() {
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
		}
	</script>
</body>
</html>

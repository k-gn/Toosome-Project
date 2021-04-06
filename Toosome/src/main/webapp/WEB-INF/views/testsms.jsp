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
	<input class="sms_phone_number_box" type="text" name="phoneNumber"
		placeholder="전화번호를 입력해주새요">
	<input class="sms_name_box" type="text" name="smsName"
		placeholder="이름을 입력해주세요." required />
	<input class="sms_phone_btn" type="button" value="인증번호 전송">
	<br />
	<br />
	<input class="sms_check_nember_box" type="text" name="sms"
		placeholder="인증 번호 입력" />
	<input class="sms_check_btn" type="button" value="확인">
	<script>
		$('.sms_phone_btn').click(function() {
			let phoneNumber = $('.sms_phone_number_box').val();
			let smsName = $('.sms_name_box').val();

			$.ajax({
				type : "GET",
				url : "sendSms?phoneNumber=" + phoneNumber,
				data : {
					"smsName" : smsName
				},
				success : function(res) {
					if(res=="18"){
						alert("전화번호와 이름이 일치하지 않습니다.");
					}else{
						alert("인증번호 발송 완료!")
						$(".sms_check_btn").click(function() {
							if ($.trim(res) == $(".sms_check_nember_box").val()) {
								alert('인증성공!')
								document.location.href = "/signin";
							} else {
								alert('error')
							}
						})
					}
				}
			})
		});
	</script>
</body>
</html>

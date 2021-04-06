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
	<input class="sms_email_box" type="text" name="email"
		placeholder="아이디를 입력하세요">
	<input class="sms_phone_number_box" type="text" name="phoneNumber"
		placeholder="핸드폰 번호를 입력하세요" required />
	<input class="sms_send_phone_btn" type="button" value="전송">
	<br />
	<br />
	<input class="sms_check_nember_box" type="text" name="sms"
		placeholder="인증번호를 입력해주세요" />
	<input class="sms_check_btn" type="button" value="확인">
	<script>
        $('.sms_send_phone_btn').click(function() {
            let email = $('.sms_email_box').val();
            let phoneNumber = $('.sms_phone_number_box').val();
            $.ajax({                
            	type : "GET",
                url : "sendPassword?phoneNumber=" + phoneNumber,
                data : {
                    "email" : email
                },
                success : function(res) {
                    if(res=="18"){
                        alert("ID와 핸드폰 번호가 일치하지 않습니다.");
                    }else{
                        alert("인증 번호 전송 완료")
                        $(".sms_check_btn").click(function() {
                            if ($.trim(res) == $(".sms_check_nember_box").val()) {
                                alert('인증 성공')
                                $.ajax({
                                	type : "GET",
                                	url : "sendRepassword?phoneNumber=" + phoneNumber,
                                	success : function(win) {
										alert("회원님의 비밀번호를 재설정하였습니다. 변경된 비밀번호는 ["+ win +"]입니다.");
									}
                                });
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

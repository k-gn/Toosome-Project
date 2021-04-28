<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link
      rel="shortcut icon"
      href="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/AnyConv.com__favicon.ico"
      type="image/x-icon"
	/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="/resources/css/share/reset.css" />
	<link rel="stylesheet" href="/resources/css/adminpages/subpages/login/changePassword.css" />
	<script src="/resources/js/adminpages/subpages/login/changePassword.js" defer></script>
	<script>
		const msg = "${msg}"
		if(msg === "modFail") {
			alert("현재 비밀번호가 올바르지 않습니다.");
		}
	</script> 
<title>A TOOSOME PLACE - Admin</title>
</head>
<body>
	<div class="bg"></div>
	<div class="login-container">
		<div class="title-container">
          <span>관리자 비밀번호 변경</span>
          <p>TOOSOME PLACE ADMINISTRATOR</p>
        </div>
        <form class="login-form" action="/admin/modPw" method="POST">
        	<input id="pwd" type="password" name="adminPwd" placeholder="현재 비밀번호를 입력하세요" required>
        	<input id="newPwd" type="password" name="adminNewPwd" placeholder="변경하실 비밀번호를 입력하세요" required>
        	<input id="newPwd2" type="password" name="adminNewPwd2" placeholder="변경하실 비밀번호를 재입력하세요" required>
        	<div id="pwdErr" class="valid"></div>
        	<button type="submit" id="subBtn" disabled>변경</button>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        	<input type="hidden" name="memberEmail" value="${email}">
        </form>
	</div>
</body>
</html>
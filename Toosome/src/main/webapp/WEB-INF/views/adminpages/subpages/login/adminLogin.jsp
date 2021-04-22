<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link
	      rel="shortcut icon"
	      href="/resources/img/AnyConv.com__favicon.ico"
	      type="image/x-icon"
	/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="/resources/css/share/reset.css" />
	<link rel="stylesheet" href="/resources/css/adminpages/subpages/login/adminLogin.css" />
	<script src="/resources/js/adminpages/subpages/login/adminLogin.js"></script>
	<script type="text/javascript">
		const msg = "${msg}";
		if(msg === "notLogin") {
			alert("로그인이 필요한 서비스 입니다.");
		}
	</script>
<title>A TOOSOME PLACE - Admin</title>
</head>
<body>
	<div class="bg"></div>
	<div class="login-container">
		<div class="title-container">
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/login/admin_login.png" alt="#">
          <span>관리자모드 로그인</span>
          <p>TOOSOME PLACE ADMINISTRATOR</p>
        </div>
        <form class="login-form" action="/admin/signin" method="POST">
        	<input type="text" name="adminId" placeholder="아이디를 입력하세요" value="${aid}" required>
        	<input type="password" name="adminPwd" placeholder="비밀번호를 입력하세요" required>
        	<div class="valid">${loginFailMsg}</div>
        	<button type="submit">로그인</button>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
	</div>
</body>
</html>
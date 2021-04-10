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
<title>A TOOSOME PLACE - Admin</title>
</head>
<body>
	<div class="bg"></div>
	<div class="login-container">
		<div class="title-container">
          <img src="/resources/img/admin/subpages/login/admin_login.png" alt="#">
          <span>관리자모드 로그인</span>
        </div>
        <form class="login-form" action="/admin/signin" method="POST">
        	<input type="text" name="adminId" placeholder="아이디를 입력하세요">
        	<input type="password" name="adminPwd" placeholder="비밀번호를 입력하세요">
        	<div class="valid">${loginFailMsg}</div>
        	<button type="submit">로그인</button>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
	</div>
</body>
</html>
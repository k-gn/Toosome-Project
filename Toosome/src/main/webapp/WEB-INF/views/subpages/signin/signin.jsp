<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
	<link rel="stylesheet" href="/resources/css/subpages/signin/login.css">
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/resources/js/subpages/signin/login.js"></script>
	<title>A TOOSOME PLACE</title>
</head>
<body>
<div class="bg"></div>
<div id="container">
	<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

	<div class="login-container">
		<div class="title-container">
			<img class="title-logo" src="/resources/img/subpages/share/banner.png" alt=""/>
			<span class="login-title">Welcome!</span><span>투썸플레이스에 오신 것을 환영합니다</span>
		</div>
		<div class="login-form">
			<form action="/signin" method="POST">
				<input type="text" name="memberEmail" id="ID" placeholder="이메일을 입력해주세요." required />
				<input type="password" name="memberPassword" id="PW" placeholder="비밀번호를 입력해주세요." required />
				<input type="submit" value="로그인">
				<div class="login-value">
					<a class="kaka" onclick="javascript:kakaoLogin()"><img src="/resources/img/subpages/signin/kakao_login.png" alt=""></a>
					<!-- 네이버 부분 -->
					
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
		<div class="btn-box">
			<a href="#" onclick="location.href='/signup'">회원가입</a>
			<a href="#" onclick="location.href='/find-id'">아이디 찾기</a>
			<a href="#" onclick="location.href='/find-pwd'">비밀번호 찾기</a>
		</div>
	</div>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
</div>
</body>
</html>
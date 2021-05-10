<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
	<link rel="stylesheet" href="/resources/css/subpages/signin/login.css">
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/resources/js/subpages/signin/login.js"></script>
	<title>A TOOSOME PLACE</title>
	<!-- 로그인 안하고 접근시 경고 메시지 -->
	<script type="text/javascript">
		const msg = "${msg}";
		if(msg === "notLogin") {
			alert("로그인이 필요한 서비스 입니다.");
		}
	</script>
</head>
<body>
<div class="bg"></div>
<div id="container">
	<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

	<!-- 로그인 페이지 -->
	<div class="login-container">
		<div class="title-container">
			<img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt=""/>
			<span class="login-title">Welcome!</span><span>투썸플레이스에 오신 것을 환영합니다</span>
		</div>
		<div class="login-form">
			<!-- 아이디/비밀번호 관련 -->
			<form action="/signin" method="POST">
				<input type="text" name="memberEmail" id="ID" placeholder="이메일을 입력해주세요." value="${mid}" required />
				<input type="password" name="memberPassword" id="PW" placeholder="비밀번호를 입력해주세요." required />
				<div class="valid">${loginFailMsg}</div>
				<div class="auto-login">
			      <div class="check-box"></div>
			      <input id="remember" name="remember" type="checkbox">Remember Me
			    </div>
				<input type="submit" value="로그인">
				
				<!-- 간편 로그인 -->
				<div class="login-value">
					<a class="kaka" onclick="loginWithKakao()"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/signin/kakao_login.png"></a>
					<a class="naver" onclick="loginWithNaver()"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/signin/naver_login.png"/></a>
				</div>
				<!-- 시큐리티 csrf 공격 방지 토큰 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
		<div class="btn-box">
			<a href="#" onclick="location.href='/agreement'">회원가입</a>
			<a href="#" onclick="location.href='/find-id'">아이디 찾기</a>
			<a href="#" onclick="location.href='/find-pwd'">비밀번호 찾기</a>
		</div>
	</div>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
</div>
</body>
</html>
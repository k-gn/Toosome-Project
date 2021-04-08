<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
	<link rel="stylesheet"
		href="/resources/css/subpages/signin/findId/findId.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="/resources/js/subpages/signin/findId/findId.js" defer></script>
	<title>A TOOSOME PLACE</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- Section Start -->
		<section>
			<div class="info">
				<h3>아이디 찾기</h3>
				<img src="/resources/img/subpages/share/warning.png" alt="#">
				<h3>잠깐!</h3>
				<p>
					투썸플레이스는 고객님의 이메일을 아이디로 사용하고 있습니다.<br> 먼저, 사용했을 만한 이메일로 <a
						href="/signin">로그인</a>을 시도해보세요.
				</p>
				<br>
				<p>계정을 찾으시려면 아래 인증 방법을 선택하세요.</p>
			</div>
			<div class="sns-auth-container">
				<p>핸드폰 인증</p>
				<div class="sns-auth">
					<img src="/resources/img/subpages/signin/auth_sns.png" alt="#">
					<button id="sns">인증하기</button>
				</div>
			</div>
		</section>
		<!-- Section End -->
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>
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
				<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/warning.png" alt="#">
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
					<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/signin/auth_sns.png" alt="#">
					<button id="sns">인증하기</button>
				</div>
			</div>
		</section>
		<!-- Section End -->
		<!-- SMS Modal -->
		<div id="sms-modal" class="modal">
			<div class="modal-content">
				<p>SMS 인증</p>
				<div class="modal-input name">
					<p>이름 입력</p>
					<input type="text" id="sms-name" name="smsName" placeholder="이름을 입력하세요">
				</div>
				<div class="modal-input phone">
					<p>핸드폰 번호 입력 <small>※(- 생략)</small></p>
					<input type="text" id="sms-phone" name="phoneNumber" placeholder="핸드폰 번호를 입력하세요">
				</div>
				<div class="modal-input code">
					<p>인증코드 입력</p>
					<input type="text" id="sms-code" name="code" placeholder="인증코드를 입력하세요">
					<button id="sms-confirm">확인</button>
					<p class="sms-error">인증코드가 일치하지 않습니다</p>
				</div>
				<div class="btn-box">
					<button id="cancle">취소</button>											
					<button id="code">인증코드 받기</button>
				</div>
			</div>
			<div class="confirm-ok">
				<div class="confirm-container">
					<p>아이디 찾기</p>
					<div id="finded-id"></div>
					<a href="/signin">로그인 페이지로 이동</a>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>
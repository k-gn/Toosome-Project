<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/signin/findPwd/findPwd.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="/resources/js/subpages/signin/findPwd/findPwd.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    <!-- Section Start -->
	<section>
       	<div class="info">
       		<h3>비밀번호 재설정</h3>
       		<img src="/resources/img/subpages/share/warning.png" alt="#">
       		<h3>잠깐!</h3>
       		<p>투썸플레이스는 고객님의 비밀번호를 기억하지 않습니다.<br>
       		아래 인증 방법을 통해 비밀번호를 재설정 할 수 있습니다.</p><br>
       		<p>아이디를 찾으시려면 <a href="/find-id">이곳</a>을 눌러주세요.</p>
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
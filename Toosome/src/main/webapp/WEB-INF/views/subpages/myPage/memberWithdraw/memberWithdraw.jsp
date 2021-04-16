<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/myPage/memberWithdraw/memberWithdraw.css">
  <script src="/resources/js/subpages/myPage/memberWithdraw/memberWithdraw.js" defer></script>
  <title>A TOOSOME PLACE</title>
  
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    <form id="dologout" action="/dologout" method="POST">
	  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
  <script>
	const msg = "${msg}"
	if(msg === "delFail") {
		alert("비밀번호가 올바르지 않습니다.");
	}else if(msg === "delSuccess") {
		alert("정상적으로 탈퇴처리 되었습니다.");
		document.getElementById('dologout').submit();
	}
  </script> 
    <!-- Section Start -->
    <section>
      <div class="signup-container">
        <div class="title-container">
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="#">
          <span class="signup-title">회원탈퇴</span>
        </div>
        <form class="signup-form-container" action="/mypage/memberwithdraw/${id}" method="post">
          <input type="hidden" name="email" value="${email}">
          <div class="signup-wrapper">
            <span>비밀번호</span>
            <input class="signup-form pwd" type="password" name="password" placeholder="비밀번호를 입력해주세요">
            <p class="validation pwd1"></p>
          </div>
          <div class="signform-btn-wrapper">
            <input class="signform-btn" type="submit" disabled="disabled" value="회원탈퇴">
          </div>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
      </div>
    </section>
    <!-- Section End -->
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
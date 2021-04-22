<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/myPage/passwordModify/passwordModify.css">
  <script src="/resources/js/subpages/myPage/passwordModify/passwordModify.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <!-- Section Start -->
    <section>
      <div class="signup-container">
        <div class="title-container">
          <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="#">
          <span class="signup-title">비밀번호 변경</span>
        </div>
        <form class="signup-form-container" action="/mypage/passwordmodify/${id}" method="post">
          <div class="signup-wrapper">
            <div class="signform-email-wrapper">
              <span>이메일</span>
            </div>
            <input class="signup-form email" type="email" name="email" value="${email}" disabled />
            <input type="hidden" name="email" value="${email}"/>
          </div>
          <div class="signup-wrapper">
            <span>현재 비밀번호</span>
            <input class="signup-form old-pwd" type="password" name="password" placeholder="현재 비밀번호를 입력해주세요">
            <p class="validation pwd1"></p>
          </div>
          <div class="signup-wrapper">
            <span>새 비밀번호</span>
            <input class="signup-form new-pwd1" type="password" name="newpassword" placeholder="새 비밀번호를 입력해주세요">
            <p class="validation pwd2"></p>
          </div>
          <div class="signup-wrapper">
            <span>새 비밀번호 재확인</span>
            <input class="signup-form new-pwd2" type="password" name="repassword" placeholder="새 비밀번호를 다시 입력해주세요">
            <p class="validation pwd3"></p>
          </div>
          <div class="signform-btn-wrapper">
            <input class="signform-btn" type="submit" disabled="disabled" value="비밀번호 변경">
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
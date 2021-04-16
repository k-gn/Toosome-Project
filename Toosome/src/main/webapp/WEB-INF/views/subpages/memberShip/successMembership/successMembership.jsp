<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/memberShip/successMembership/successMembership.css">
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="login-container">
      <div class="title-container">
      	<img class="title-logo" src="./img/banner.png" alt="">
      	<span class="login-title">멤버십 가입완료</span>
      </div>
      <div class="signup-text">
        <div class="comment">
          <h2>멤버십 가입이 정상적으로 완료되었습니다.</h2>
          <h3>마이멤버십에서 등급을 확인해주시기 바랍니다.</h3>
          <a href="#">My MemberShip</a>
        </div>
      </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
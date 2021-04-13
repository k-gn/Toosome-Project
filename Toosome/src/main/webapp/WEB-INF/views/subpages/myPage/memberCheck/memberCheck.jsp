<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/myPage/memberCheck/memberCheck.css">
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <!-- Section Start -->
    <section>
      <div class="signup-container">
        <div class="title-container">
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="#">
          <span class="signup-title">개인정보</span>
        </div>
        <form class="signup-form-container" action="#">
          <div class="signup-wrapper">
            <div class="signform-email-wrapper">
              <span>이메일</span>
            </div>
            <input class="signup-form email" type="email" name="email" disabled />
          </div>
          
          <div class="signup-wrapper">
            <span>전화번호</span>
            <div class="signup-form-tb" style="display: block;">
              <input class="signup-form tel0" type="tel" name="phone1" disabled style="width: 130px;"/>
              &nbsp;-&nbsp;
              <input class="signup-form tel1" type="tel" name="phone2" disabled/>
              &nbsp;-&nbsp;
              <input class="signup-form tel2" type="tel" name="phone3" disabled/>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>우편번호</span>
            <div class="signup-form-tb" style="display: block; padding-left: 0px;">
              <input class="signup-form postcode" type="text" name="post1" disabled/>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>주소</span>
            <input class="signup-form addr1" type="text" name="address1" disabled/>
          </div>
          <div class="signup-wrapper">
            <span>상세주소</span>
            <input class="signup-form addr2" type="text" name="address2" disabled/>
            <p class="validation addr2"></p>
          </div>
          <div class="signform-btn-wrapper">
            <input class="signform-btn" type="submit" value="정보수정" style="margin-bottom: 30px;">
            <input class="signform-btn" type="submit" value="개인정보확인">
          </div>
        </form>
      </div>
    </section>
    <!-- Section End -->
    
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
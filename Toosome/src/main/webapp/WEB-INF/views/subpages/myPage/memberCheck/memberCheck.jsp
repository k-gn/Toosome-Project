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
        <div class="signup-form-container">
          <div class="signup-wrapper">
            <div class="signform-email-wrapper">
              <span>이메일</span>
            </div>
            <input class="signup-form email" type="email" name="email" value="${member.memberEmail}" disabled />
          </div>
          
          <div class="signup-wrapper">
            <span>전화번호</span>
            <div class="signup-form-tb" style="display: block;">
              <input class="signup-form tel0" type="tel" name="phone1" value="${map.tel1}" disabled style="width: 130px;"/>
              &nbsp;-&nbsp;
              <input class="signup-form tel1" type="tel" name="phone2" value="${map.tel2}" disabled/>
              &nbsp;-&nbsp;
              <input class="signup-form tel2" type="tel" name="phone3" value="${map.tel3}" disabled/>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>우편번호</span>
            <div class="signup-form-tb" style="display: block; padding-left: 0px;">
              <input class="signup-form postcode" type="text" name="post1" value="${map.address1}" disabled/>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>주소</span>
            <input class="signup-form addr1" type="text" name="address1" value="${map.address2}" disabled/>
          </div>
          <div class="signup-wrapper">
            <span>상세주소</span>
            <input class="signup-form addr2" type="text" name="address2" value="${map.address3}" disabled/>
            <p class="validation addr2"></p>
          </div>
          <div class="signform-btn-wrapper">
            <a href="/mypage/update/${id}" class="signform-btn" style="margin-bottom: 30px;">정보수정</a>
            <a href="/mypage" class="signform-btn">마이페이지로</a>
          </div>
        </div>
      </div>
    </section>
    <!-- Section End -->
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
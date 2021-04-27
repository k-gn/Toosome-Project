<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/agreement/agreement.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="/resources/js/subpages/agreement/agreement.js" defer></script>
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
          <span class="signup-title">회원가입</span>
        </div>
        <div class="contents-container">
          <div class="sign-all">
            <span class="sign-all-info">전체 동의</span>
            <div class="sign-all-btn"></div>
          </div>
          <div class="sign-each-wrapper">
          <c:forEach var="termsList" items="${termsList}">
          <div class="sign-each">
            <span class="sign-each-info">${termsList.termsTitle}<span style="color:red;">(필수)</span></span>
            <div class="sign-each-btn"></div>
          </div>
            <div class="sign-terms-wrapper">
              <p class="sign-terms">${termsList.termsContent}</p>
            </div>
            </c:forEach>
            <div class="sign-each">
              <span class="sign-each-info">E-mail 및 SMS 광고성 정보 수신 동의 <span style="color:red;">(선택)</span></span>
              <div class="sign-each-btn"></div>
            </div>
            <p class="sign-choice-info">다양한 프로모션 소식 및 신규 매장 정보를 보내드립니다.</p>
          </div>
        </div>
        <div class="signup-btn-wrapper">
          <span class="signup-info">※ 약관의 필수 동의사항에 체크해주세요.</span>
          <input class="signup-btn" type="button" disabled="disabled" value="회원가입">
        </div>
      </div>
    </section>
    <!-- Section End -->
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
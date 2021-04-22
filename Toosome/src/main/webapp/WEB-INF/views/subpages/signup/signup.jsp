<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  <link rel="stylesheet" href="/resources/css/subpages/signup/signup.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- 우편번호 api -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/resources/js/subpages/signup/signup.js" defer></script>
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
        <form class="signup-form-container">
          <div class="signup-wrapper">
            <div class="signform-email-wrapper">
              <span>이메일</span>
              <input class="email-auth-btn" type="button" value="이메일 인증" disabled="disabled">
            </div>
            <input class="signup-form email" type="email" name="email" placeholder="이메일 주소를 입력해주세요">
            <p class="validation email"></p>
            <p class="email-auth-ok">인증 완료</p>
          </div>
          <div id="email-auth-form">
            <div class="auth-info-wrapper">
              <p class="email-auth-info">입력하신 이메일 주소로 인증번호가 발송되었습니다.<br>
                  인증번호를 입력하신 후 확인 버튼을 눌러주세요.</p>
              <label class="email-auth-time">02:59</label>
            </div>
            <div class="signup-wrapper">
              <div class="signform-email-wrapper">
                <span>인증번호 입력</span>
                <input class="submit-auth-btn" type="button" value="확인" disabled="disabled">
              </div>
              <input class="signup-form auth" type="text" name="auth" placeholder="인증번호를 입력해주세요">
              <p class="validation auth"></p>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>비밀번호</span>
            <input class="signup-form pwd1" type="password" name="password" placeholder="비밀번호를 입력해주세요">
            <p class="validation pwd1"></p>
          </div>
          <div class="signup-wrapper">
            <span>비밀번호 재확인</span>
            <input class="signup-form pwd2" type="password" name="repassword" placeholder="비밀번호를 다시 입력해주세요">
            <p class="validation pwd2"></p>
          </div>
          <div class="signup-wrapper">
            <span>이름</span>
            <input class="signup-form name" type="text" name="name" placeholder="이름을 입력해주세요">
            <p class="validation name"></p>
          </div>
          <div class="signup-wrapper">
            <span>생년월일</span>
            <div class="signup-form-tb">
              <input class="signup-form year" type="text" name="year" placeholder="년(4자)">
              <select class="signup-form month" name="month">
                <option value="default" selected>월</option>
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">3</option>
                <option value="04">4</option>
                <option value="05">5</option>
                <option value="06">6</option>
                <option value="07">7</option>
                <option value="08">8</option>
                <option value="09">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
              <input class="signup-form date" type="text" name="date" placeholder="일">
            </div>
            <p class="validation birth"></p>
          </div>
          <div class="signup-wrapper">
            <span>전화번호</span>
            <div class="signup-form-tb">
              <select class="signup-form agency" name="phone1">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
              </select>
              <input class="signup-form tel1" type="tel" name="phone2" placeholder="(4자리)">
              <input class="signup-form tel2" type="tel" name="phone3" placeholder="(4자리)">
            </div>
            <p class="validation tel"></p>
          </div>
          <div class="signup-wrapper">
            <span>우편번호</span>
            <div class="signup-form-tb">
              <input class="signup-form postcode" type="text" name="post1" placeholder="(5자리)">
              <input class="post-search" type="button" value="검색">
            </div>
            <p class="validation postcode"></p>
          </div>
          <div class="signup-wrapper">
            <span>주소</span>
            <input class="signup-form addr1" type="text" name="address1" placeholder="주소를 입력해주세요">
            <p class="validation addr1"></p>
          </div>
          <div class="signup-wrapper">
            <span>상세주소</span>
            <input class="signup-form addr2" type="text" name="address2" placeholder="상세 주소를 입력해주세요">
            <p class="validation addr2"></p>
          </div>
          <div class="signform-btn-wrapper">
            <input class="signform-btn" type="button" disabled="disabled" value="회원가입">
          </div>
        </form>
      </div>
    </section>
    <!-- Section End -->
   	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  <link rel="stylesheet" href="/resources/css/subpages/myPage/memberUpdate/memberUpdate.css">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/resources/js/subpages/myPage/memberUpdate/memberUpdate.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    <section>
      <div class="signup-container">
        <div class="title-container">
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="#">
          <span class="signup-title">회원정보수정</span>
        </div>
        <form class="signup-form-container" action="/mypage/update" method="post">
          <div class="signup-wrapper">
            <span>이름</span>
            <input class="signup-form name" type="text" name="name" placeholder="이름을 입력해주세요" value="${member.memberName}" required/>
          </div>
          
          <div class="signup-wrapper">
            <span>전화번호</span>
            <div class="signup-form-tb">
              <select class="signup-form agency" name="phone1">
                <option value="010" ${map.tel1 == '010' ? 'selected' : ''}>010</option>
                <option value="011" ${map.tel1 == '011' ? 'selected' : ''}>011</option>
                <option value="016" ${map.tel1 == '016' ? 'selected' : ''}>016</option>
                <option value="017" ${map.tel1 == '017' ? 'selected' : ''}>017</option>
                <option value="018" ${map.tel1 == '018' ? 'selected' : ''}>018</option>
                <option value="019" ${map.tel1 == '019' ? 'selected' : ''}>019</option>
              </select>
              <input class="signup-form tel1" type="tel" name="phone2" placeholder="(4자리)" value="${map.tel2}" required/>
              <input class="signup-form tel2" type="tel" name="phone3" placeholder="(4자리)" value="${map.tel3}" required/>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>우편번호</span>
            <div class="signup-form-tb">
              <input class="signup-form postcode" type="text" name="post1" placeholder="(5자리)" value="${map.address1}" required/>
              <input class="post-search" type="button" value="검색">
            </div>
          </div>
          <div class="signup-wrapper">
            <span>주소</span>
            <input class="signup-form addr1" type="text" name="address1" placeholder="주소를 입력해주세요" value="${map.address2}" required/>
          </div>
          <div class="signup-wrapper">
            <span>상세주소</span>
            <input class="signup-form addr2" type="text" name="address2" placeholder="상세 주소를 입력해주세요" value="${map.address3 == null ? '' : map.address3}" required/>
            <p class="validation addr2"></p>
          </div>
          <div class="signform-btn-wrapper">
            <input class="signform-btn" type="button" value="정보수정" onclick="updateMember()">
          </div>
          <input class="signup-form mid" type="hidden" name="id" value="${member.memberId}">
        </form>
      </div>
    </section>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>

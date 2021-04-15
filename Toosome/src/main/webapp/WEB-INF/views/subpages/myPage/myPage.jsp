<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/subpages/myPage/myPage.css">
<script src="/resources/js/subpages/myPage/myPageTap.js"></script>
<title>A TOOSOME PLACE</title>
<script>
	const msg = "${msg}"
	if(msg === "modSuccess") {
		alert("비밀번호가 변경되었습니다.");
	}else if(msg === "Denied") {
		alert("잘못된 접근입니다.");
	}else if(msg === "notSocial") {
		alert("소셜회원은 이용할 수 없는 서비스 입니다.");
	}
</script> 
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="my-container">
      <div id="main">
          <span class="myTitle">개인정보관리</span>
          <div class="grid-box">
            <ul class="grid">
              <li>
                <p class="list-title">
                  개인정보수정
                </p>
                <img src="/resources/img/subpages/myPage/edit.png" alt="">
                <p class="list-comment">
                  주소, 전화번호 등<br/>
                  <strong>개인정보를 수정 / 추가</strong>할 수 있습니다.
                </p>
                <input type="button" value="개인정보 수정" onclick="location.href='/mypage/update/${id}'">
              </li>

              <li>
                <p class="list-title">
                  비밀번호변경
                </p>
                <img src="/resources/img/subpages/myPage/password.png" alt="">
                <p class="list-comment">
                  안전한 개인정보보호를 위해<br/>
                  <strong>비밀번호는 주기적으로 변경</strong>해 주세요.
                </p>
                <input type="button" value="비밀번호 변경" onclick="location.href='/mypage/passwordmodify'">
              </li>

              <li>
                <p class="list-title">
                  회원탈퇴
                </p>
                <img src="/resources/img/subpages/myPage/logout.png" alt="">
                <p class="list-comment">
                  간단한 절차를 통해<br/>
                  <strong>회원 탈퇴</strong>를 할 수 있습니다.
                </p>
                <input type="button" value="회원 탈퇴" onclick="location.href='/mypage/memberwithdraw'">
              </li>
            </ul>
          </div>
      </div>

      <div class="nav-cover">
        <div class="nav">
          <ul>
            <li>
              <a href="#">마이투썸</a>
              <ul>
                <li><a href="/mypage">개인정보관리</a></li>
                <li><a href="/mypage/check/${id}">개인정보</a></li>
                <li><a href="#">마이멤버십</a></li>
              </ul>
            </li>
            <li>
              <a href="#">고객센터</a>
              <ul>
                <li><a href="#">FAQ</a></li>
              </ul>
            </li>
            <li>
              <a href="#">온라인 주문</a>
              <ul>
                <li><a href="#">이용안내</a></li>
                <li><a href="#">투썸바구니</a></li>
                <li><a href="#">결제내역</a></li>
              </ul>
            </li>
            <li>
              <a href="#">리쿠르트</a>
              <ul>
                <li><a href="#">리쿠르트안내</a></li>
                <li><a href="#">매장채용안내</a></li>
                <li><a href="#">아카데미등록안내</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
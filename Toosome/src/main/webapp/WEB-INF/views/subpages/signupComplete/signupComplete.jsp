<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="resources/css/subpages/signupComplete/signupComplete.css">
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="login-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="login-title">회원가입완료</span>
            </div>
            <div class="signup-text">
                <div class="comment">
                    <h2>회원가입이 정상적으로 완료되었습니다.</h2>
                    <h3>로그인 후 이용해주세요.</h3>
                    <a href="/signin">Log In</a>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
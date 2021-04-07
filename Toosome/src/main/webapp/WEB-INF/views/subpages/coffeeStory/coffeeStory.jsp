<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/coffeeStory/coffeeStory.css">
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="coffeestory-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="coffeestory-title">CoffeeStory</span>
            </div>

            <div class="contents">
                <img src="/resources/img/subpages/coffeeStory/img_coffeestory.png" alt="">
            </div>
        </div>
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
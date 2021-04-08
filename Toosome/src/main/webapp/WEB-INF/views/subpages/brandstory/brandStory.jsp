<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/brandstory/brandStory.css">
    <script src="/resources/js/subpages/brandstory/brandStory.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="brandstory-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="brandstory-title">BrandStory</span>
            </div>

            <div class="content-box">
                <div class="menu-btn">
                    <ul class="btn-tab">
                        <li class="select"><a href="#">투썸플레이스 소개</a></li>
                        <li><a href="#">투썸플레이스 히스토리</a></li>
                        <li><a href="#">투썸플레이스 BI</a></li>
                    </ul>
                </div>
                <div class="menu-contents">
                    <ul class="tab-img">
                        <li><img src="/resources/img/subpages/brandstory/txt_brandstory01.gif" alt=""></li>
                        <li><img src="/resources/img/subpages/brandstory/txt_brandstory02.gif" alt=""></li>
                        <li><img src="/resources/img/subpages/brandstory/txt_brandstory03.gif" alt=""></li>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
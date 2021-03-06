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
                <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
            </div>
            <div class="sub-header-container">
       			<h3>Brand Story</h3>
       			<div class="navigation-container">
       				<ul>
       					<li><a href="/">HOME</a></li>
       					<li><a href="/brandstory">ABOUT US</a></li>
       					<li><a href="/brandstory">브랜드이야기</a></li>
       				</ul>
       			</div>
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
                        <li><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/brandStory/txt_brandstory01.gif" alt=""></li>
                        <li><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/brandStory/txt_brandstory02.gif" alt=""></li>
                        <li><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/brandStory/txt_brandstory03.gif" alt=""></li>
                    </ul>
                </div>
            </div>
        </div>
        <img class="bg1" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/brandStory/wondo2.png" alt="#">
        <img class="bg2" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/brandStory/wondo3.png" alt="#">
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
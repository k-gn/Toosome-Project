<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/menu/menu.css">
	<script src="/resources/js/share/jquery.easing.1.3.js"></script>
    <script src="/resources/js/subpages/menu/menu.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="menu-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="menu-title">MENU</span>
            </div>

            <div class="tab-container">
                <div class="menu-btn">
                    <ul class="btn-tab">
                        <li class="select"><a href="#new">NEW</a></li>
                        <li><a href="#beverage">beverage</a></li>
                        <li><a href="#dessert">dessert</a></li>
                        <li><a href="#delhi">delhi</a></li>
                        <li><a href="#whole-cake">whole cake</a></li>
                        <div class="ani-border"></div>
                    </ul>
                </div>
                <div class="menu-content">
                    <ul id="new" class="cf">
                        <h3>NEW</h3>
                        <li><a href="#" onclick="location.href='/newdetail'"><span>신메뉴1</span></a></li>
                        <li><a href="#"><span>신메뉴2</span></a></li>
                        <li><a href="#"><span>신메뉴3</span></a></li>
                        <li><a href="#"><span>신메뉴4</span></a></li>
                        <li><a href="#"><span>신메뉴5</span></a></li>
                    </ul>
                    <ul id="beverage" class="cf">
                        <h3>beverage</h3>
                        <li><a href="#" onclick="location.href='/beveragedetail'"><span>음료1</span></a></li>
                        <li><a href="#"><span>음료2</span></a></li>
                        <li><a href="#"><span>음료3</span></a></li>
                        <li><a href="#"><span>음료4</span></a></li>
                        <li><a href="#"><span>음료5</span></a></li>
                    </ul>
                    <ul id="dessert" class="cf">
                        <h3>dessert</h3>
                        <li><a href="#" onclick="location.href='/dessertdetail'"><span>디저트1</span></a></li>
                        <li><a href="#"><span>디저트2</span></a></li>
                        <li><a href="#"><span>디저트3</span></a></li>
                        <li><a href="#"><span>디저트4</span></a></li>
                        <li><a href="#"><span>디저트5</span></a></li>
                    </ul>
                    <ul id="delhi" class="cf">
                        <h3>delhi</h3>
                        <li><a href="#" onclick="location.href='/delhidetail'"><span>델리1</span></a></li>
                        <li><a href="#"><span>델리2</span></a></li>
                        <li><a href="#"><span>델리3</span></a></li>
                        <li><a href="#"><span>델리4</span></a></li>
                        <li><a href="#"><span>델리5</span></a></li>
                    </ul>
                    <ul id="whole-cake" class="cf">
                        <h3>whole cake</h3>
                        <li><a href="#" onclick="location.href='/wholecakedetail'"><span>홀케이크1</span></a></li>
                        <li><a href="#"><span>홀케이크2</span></a></li>
                        <li><a href="#"><span>홀케이크3</span></a></li>
                        <li><a href="#"><span>홀케이크4</span></a></li>
                        <li><a href="#"><span>홀케이크5</span></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
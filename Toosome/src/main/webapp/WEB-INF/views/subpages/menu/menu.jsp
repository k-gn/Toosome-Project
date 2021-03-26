<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<script src="resources/js/share/jquery-3.1.1.js"></script>
	<script src="/resources/js/share/jquery.easing.1.3.js"></script>
  	<script src="/resources/js/share/nav_footer.js"></script>
    <script src="/resources/js/subpages/menu/menu.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/subpages/menu/menu.css">
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <header>
            <h1 class="logo">
                <a href="#">
                    A THREESOME PLACE
                </a>
            </h1>
            <nav>
                <ul class="nav">
                    <li class="menu-title">
                        <a href="#">ABOUT US</a>
                        <ul class="sub-con">
                            <li><a href="#">브랜드이야기</a></li>
                            <li><a href="#">커피이야기</a></li>
                            <li><a href="#">디저트이야기</a></li>
                            <li><a href="#">브랜드필름</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">
                        <a href="#">MENU</a>
                        <ul class="sub-con">
                            <li><a href="#">NEW</a></li>
                            <li><a href="#">커피&음료</a></li>
                            <li><a href="#">디저트</a></li>
                            <li><a href="#">델리</a></li>
                            <li><a href="#">홀케이크</a></li>
                            <li><a href="#">상품</a></li>
                            <li><a href="#">영양성분표</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">
                        <a href="#">STORE</a>
                        <ul class="sub-con">
                            <li><a href="#">매장안내</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">
                        <a href="#">WHAT'S NEW</a>
                        <ul class="sub-con">
                            <li><a href="#">이벤트</a></li>
                            <li><a href="#">멤버쉽&제휴카드</a></li>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">기업 및 단체구매 안내</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">
                        <a href="#">FRANCHISE</a>
                        <ul class="sub-con">
                            <li><a href="#">창업정보</a></li>
                            <li><a href="#">가맹점 전용 금융 상품</a></li>
                            <li><a href="#">창업설명회</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </nav>
            
            <div class="full-cover"></div>

            <ul class="log">
                <li><a href="#">LOGIN</a></li>
                <li><a href="#">SIGN UP</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </header>

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
                        <li><a href="#"><span>신메뉴1</span></a></li>
                        <li><a href="#"><span>신메뉴2</span></a></li>
                        <li><a href="#"><span>신메뉴3</span></a></li>
                        <li><a href="#"><span>신메뉴4</span></a></li>
                        <li><a href="#"><span>신메뉴5</span></a></li>
                    </ul>
                    <ul id="beverage" class="cf">
                        <h3>beverage</h3>
                        <li><a href="#"><span>음료1</span></a></li>
                        <li><a href="#"><span>음료2</span></a></li>
                        <li><a href="#"><span>음료3</span></a></li>
                        <li><a href="#"><span>음료4</span></a></li>
                        <li><a href="#"><span>음료5</span></a></li>
                    </ul>
                    <ul id="dessert" class="cf">
                        <h3>dessert</h3>
                        <li><a href="#"><span>디저트1</span></a></li>
                        <li><a href="#"><span>디저트2</span></a></li>
                        <li><a href="#"><span>디저트3</span></a></li>
                        <li><a href="#"><span>디저트4</span></a></li>
                        <li><a href="#"><span>디저트5</span></a></li>
                    </ul>
                    <ul id="delhi" class="cf">
                        <h3>delhi</h3>
                        <li><a href="#"><span>델리1</span></a></li>
                        <li><a href="#"><span>델리2</span></a></li>
                        <li><a href="#"><span>델리3</span></a></li>
                        <li><a href="#"><span>델리4</span></a></li>
                        <li><a href="#"><span>델리5</span></a></li>
                    </ul>
                    <ul id="whole-cake" class="cf">
                        <h3>whole cake</h3>
                        <li><a href="#"><span>홀케이크1</span></a></li>
                        <li><a href="#"><span>홀케이크2</span></a></li>
                        <li><a href="#"><span>홀케이크3</span></a></li>
                        <li><a href="#"><span>홀케이크4</span></a></li>
                        <li><a href="#"><span>홀케이크5</span></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="foot-cover">
                <ul class="foot-first cf">
                    <li><a href="#">사이트맵</a></li>
                    <li><a href="#">리쿠르트</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li class="yellow"><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">위치기반서비스 이용약관</a></li>
                    <li><a href="#">이메일 무단수집거부</a></li>
                    <li><a href="#">법적고지</a></li>
                </ul>
                <ul class="foot-second cf">
                    <li>
                        <address>서울특별시 중구 을지로 170, 8층(을지로4가, 을지로트윈타워) 투썸플레이스(주)</address>
                    </li>
                    <li>대표이사 : 이영상</li>
                    <li>개인정보보호책임자 : 장재호</li>
                    <li>고객센터 :&nbsp;<a href="tel:1577-4410">1577-4410</a></li>
                    <li>팩스 : 02-2058-6777</li>
                    <li>사업자등록번호 : 404-86-01054</li>
                </ul>
                <ul class="foot-last cf">
                    <li>통신판매업종신고증 : 제 2018-서울중구-0353호</li>
                    <li>대표이메일 : helpmaster@twosome.co.kr</li>
                    <li> Copyright &copy; 2020 A TWOSOME PLACE CO. LTD. ALL RIGHTS RESERVED.</li>
                </ul>
                <div class="f_sns">
                    <article class="art1"><a href="#"></a></article>
                    <article class="art2"><a href="#"></a></article>
                    <article class="art3"><a href="#"></a></article>
                    <article class="art4"><a href="#"></a></article>
                    <article class="art5"><a href="#"></a></article>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>
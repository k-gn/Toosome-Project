<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="resources/css/reset.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/main.css" />
    <link rel="stylesheet" href="resources/css/slick.css" />
    <link rel="stylesheet" href="resources/css/slick-theme.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="shortcut icon"
      href="resources/img/AnyConv.com__favicon.ico"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <script src="http://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="resources/js/jquery.mousewheel.min.js"></script>
    <script src="resources/js/slick.js"></script>
    <script src="resources/js/jquery.bxslider.js"></script>
    <script src="resources/js/script.js"></script>
    <title>A TWOSOME PLACE</title>
  </head>
  <body>
    <div id="container">
      <header>
        <h1 class="logo">
          <a href="index.html">
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
          <li><a onclick="location.href='resources/html/subpage/signin/login.html'">LOGIN</a></li>
          <li><a onclick="location.href='/subpages/agreement/agreement.jsp'">SIGN UP</a></li>
          <li><a href="#">FAQ</a></li>
        </ul>
      </header>
      <div id="img-wrap" class="img-slide">
        <div class="slide">
          <ul class="slide-imgs cf slider autoplay">
            <li><img src="resources/img/1.png" alt="" /></li>
            <li><img src="resources/img/2.png" alt="" /></li>
            <li><img src="resources/img/3.png" alt="" /></li>
          </ul>
        </div>
      </div>
      <div id="new-menu" class="img-slide">
        <div class="new-cover">
          <p class="new">NEW</p>
          <div class="img_box">
            <ul class="new-menu-box cf">
              <li>
                <a href="#"><img src="resources/img/c-001.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/c-002.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/c-003.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/c-004.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/c-005.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-001.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-002.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-003.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-004.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-005.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-006.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-007.PNG" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-008.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/h-009.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-001.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-002.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-003.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-004.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-005.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-006.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-007.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-008.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-009.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-010.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-011.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="resources/img/K-012.png" alt="" /></a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="section">
        <div class="quick-menu">
          <div class="quick-menu-coffee">
            <div class="coffee">
              <a href="#"></a>
              <span class="quick-title">Coffee & Cake</span>
            </div>
            <div class="coffee-ment">
              <h3>전문가의 섬세함으로<br />완성한 최상의 커피</h3>
              <p>
                투썸플레이스의 큐그레이더(Q-grader)는 <br />좋은 원산지의 신선한
                원두만을 선별해<br />
                개성 있는 풍미의 블렌드를 제공합니다. <br />원두 타입별 최적의
                밸런스를 맞춘 로스팅 <br />
                포인트에 최상의 에스프레소 추출 기술을 <br> 더해 오늘도 가장 맛있는 커피를 완성합니다.
              </p>
            </div>
          </div>
          <div class="quick-menu-beverage">
            <div class="beverage">
            <a href="#"></a>
              <span class="quick-title">Tumbler & Goods</span>
            </div>
            <div class="beverage-ment">
              <h3>일상에 가치를 더하는<br />라이프스타일 MD 상품</h3>
              <p>
                감각적인 디자인과 실용성을 동시에<br />
                갖춘 투썸플레이스만의 MD 상품은<br />
                당신의 스타일을 돋보이게 합니다.
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="button-logo">
        <div class="button-img"></div>
        <a class="offbutton" href="#">
          <span class="button-text">Click!!</span>
        </a>
        <a class="onbutton" href="#">Click!!</a>
      </div>
      <div class="button-bar-block">
        <div class="button-bar">
          <ul class="online-icon">
            <li>
              <a href="#"
                ><img src="resources/img/conversation.png" alt="" /><span
                  >온라인상담</span
                ></a
              >
            </li>
            <li>
              <a href="#"
                ><img src="resources/img/giftbox.png" alt="" /><span
                  >온라인주문</span
                ></a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="map">
        <div class="form-cover">
          <form action="#" method="get">
            <h1>STORE</h1>

            <fieldset>
              <legend>
                <h3>매장 찾기</h3>
              </legend>
              <input
                type="search"
                name="store"
                id="search"
                placeholder="매장명 또는 주소를 입력해 주세요."
              />
              <input type="submit" value="" />
            </fieldset>
          </form>
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
              <address>
                서울특별시 중구 을지로 170, 8층(을지로4가, 을지로트윈타워)
                투썸플레이스(주)
              </address>
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
            <li>
              Copyright &copy; 2020 A TWOSOME PLACE CO. LTD. ALL RIGHTS
              RESERVED.
            </li>
          </ul>
          <div class="f_sns">
            <article class="art1"><a href="#"></a></article>
            <article class="art2"><a href="#"></a></article>
            <article class="art3"><a href="#"></a></article>
            <article class="art4"><a href="#"></a></article>
            <article class="art5"><a href="#"></a></article>
          </div>
          <a onclick="location.href='resources/html/subpage/signin/login.html'">LOGIN</a>
        </div>
      </div>
    </div>
  </body>
</html>

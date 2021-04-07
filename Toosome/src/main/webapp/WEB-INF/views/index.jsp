<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="/resources/css/main/main.css" />
    <link rel="stylesheet" href="/resources/css/main/slick.css" />
    <link rel="stylesheet" href="/resources/css/main/slick-theme.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />  
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <script src="/resources/js/main/jquery.mousewheel.min.js"></script>
    <script src="/resources/js/main/slick.js"></script>
    <script src="/resources/js/main/script.js"></script>
    <title>A TOOSOME PLACE</title>
  </head>
  <body>
    <div id="container">
      <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
      <div id="img-wrap" class="img-slide">
        <div class="slide">
          <ul class="slide-imgs cf slider autoplay">
            <li><img src="/resources/img/1.png" alt="" /></li>
            <li><img src="/resources/img/2.png" alt="" /></li>
            <li><img src="/resources/img/3.png" alt="" /></li>
          </ul>
        </div>
      </div>
      <div id="new-menu" class="img-slide">
        <div class="new-cover">
          <p class="new">NEW</p>
          <div class="img_box">
            <ul class="new-menu-box cf slider autoplay2">
              <li>
                <a href="#"><img src="/resources/img/c-001.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/c-002.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/c-003.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/c-004.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/c-005.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-001.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-002.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-003.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-004.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-005.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-006.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-007.PNG" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-008.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/h-009.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-001.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-002.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-003.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-004.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-005.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-006.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-007.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-008.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-009.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-010.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-011.png" alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="/resources/img/K-012.png" alt="" /></a>
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
              <span class="quick-title">Coffee &amp; Cake</span>
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
              <span class="quick-title">Tumbler &amp; Goods</span>
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
                ><img src="/resources/img/conversation.png" alt="" /><span
                  >온라인상담</span
                ></a
              >
            </li>
            <li>
              <a href="#"
                ><img src="/resources/img/giftbox.png" alt="" /><span
                  >온라인주문</span
                ></a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="map">
        <div class="form-cover">
          <form action="/map?" method="GET">
            <h1>STORE</h1>

            <fieldset>
              <legend>
                <h3>매장 찾기</h3>
              </legend>
              <input
                type="search"
                name="address"
                id="search"
                placeholder="매장명 또는 주소를 입력해 주세요."
              />
              <input id="search-button" type="submit" value="" />
            </fieldset>
            
          </form>
        </div>
      </div>
      <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>

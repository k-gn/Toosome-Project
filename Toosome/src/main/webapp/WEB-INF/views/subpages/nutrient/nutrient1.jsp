<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/resources/css/share/reset.css">
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <link
      rel="shortcut icon"
      href="/resources/img/AnyConv.com__favicon.ico"
      type="image/x-icon"
    />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/subpages/nutrient/nutrient.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/share/jquery-3.1.1.js"></script>
  <script src="/resources/js/share/nav_footer.js"></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
      <header>
        <h1 class="logo">
          <a href="#">
            A TOOSOME PLACE
          </a>
        </h1>
        <nav>
          <ul class="nav">
            <li class="menu-title">
              <a href="#">ABOUT US</a>
              <ul class="sub-con">
                <li><a href="#" onclick="location.href='/brandstory'">브랜드이야기</a></li>
                <li><a href="#" onclick="location.href='/coffeestory'">커피이야기</a></li>
                <li><a href="#" onclick="location.href='/dessertstory'">디저트이야기</a></li>
                <li><a href="#" onclick="location.href='/brandfilm'">브랜드필름</a></li>
              </ul>
            </li>
            <li class="menu-title">
              <a href="#" onclick="location.href='/menu'">MENU</a>
              <ul class="sub-con">
                <li><a href="#">NEW</a></li>
                <li><a href="#">커피&amp;음료</a></li>
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
                <li><a href="#" onclick="location.href='/map'">매장안내</a></li>
              </ul>
            </li>
            <li class="menu-title">
              <a href="#">WHAT'S NEWS</a>
              <ul class="sub-con">
                <li><a href="#" onclick="location.href='/event'">이벤트</a></li>
                <li><a href="#" onclick="location.href='/membership'">멤버쉽</a></li>
                <li><a href="#" onclick="location.href='/notice'">공지사항</a></li>
                <li><a href="#" onclick="location.href='/news'">뉴스</a></li>
                <li><a href="#" onclick="location.href='/qna'">QnA</a></li>
              </ul>
            </li>
            <li class="menu-title">
              <a href="#">OTHERS</a>
              <ul class="sub-con">
                <li><a href="#" onclick="location.href='/franchise'">창업정보</a></li>
                <li><a href="#" onclick="location.href='/franchisepay'">가맹점 전용 금융 상품</a></li>
                <li><a href="#" onclick="location.href='/explanation'">창업설명회</a></li>
                <li><a href="#" onclick="location.href='/allbuy'">기업 및 단체구매 안내</a></li>
              </ul>
            </li>
          </ul>
        </nav>
        <div class="full-cover"></div>
        <ul class="log">
          <li><a href="#" onclick="location.href='/signin'">LOGIN</a></li>
          <li><a href="#" onclick="location.href='/agreement'">SIGN UP</a></li>
          <li><a href="#">BASKET</a></li>
          <li><a href="#" onclick="location.href='/faq'">FAQ</a></li>
        </ul>
      </header>
    <!-- header-end -->
    
    <div class="nutrient-container">
      <div class="title-container">
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
          <span class="nutrient-title">영양성분표</span>
      </div>

      <div class="contents">
        <ul class="menu-tab">
          <li class="click"><a href="#" onclick="location.href='/nutrienta'">디저트</a></li>
          <li><a href="#" onclick="location.href='/nutrientb'">케이크</a></li>
          <li><a href="#" onclick="location.href='/nutrientc'">커피 &amp; 음료</a></li>
          <li><a href="#" onclick="location.href='/nutrientd'">델리</a></li>
        </ul>

        <div class="search">
          <input type="search" placeholder="검색어를 입력하세요.">
          <input type="image" src="/resources/img/subpages/nutrient/search.gif" alt="">
        </div>

        <table class="table table-hover">
          <thead class="thead-dark">
            <tr>
              <th>제품명</th>
              <th>총 제공량</th>
              <th>1회 제공량</th>
              <th>중량 / 용량<br/>(g) / (ml)</th>
              <th>열량<br/>(kcal)</th>
              <th>당류<br/>(g/%)</th>
              <th>단백질<br/>(g/%)</th>
              <th>포화지방<br/>(g/%)</th>
              <th>나트륨<br/>(mg/%)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>베리 리치 프라페</td>
              <td>1잔</td>
              <td>414ml</td>
              <td>414</td>
              <td>210</td>
              <td>49/49</td>
              <td>1g미만/1</td>
              <td>0/0</td>
              <td>10/1</td>
            </tr>
            <tr>
              <td>베리 리치 프라페</td>
              <td>1잔</td>
              <td>414ml</td>
              <td>414</td>
              <td>210</td>
              <td>49/49</td>
              <td>1g미만/1</td>
              <td>0/0</td>
              <td>10/1</td>
            </tr>
          </tbody>
        </table>
        <form action="#" method="get">
		    <input type="file">
		    <div class="qna-radio-container">
                 <span class="title">공개 범위</span>
                 <input type="radio" name="openScope" value="public" checked>공개
                 <input type="radio" name="openScope" value="private">비공개
              </div>
		</form>

        
      </div>
    </div>

    
    <!-- footer-start -->
    <div class="footer">
        <div class="foot-cover">
          <ul class="foot-first cf">
            <li><a href="#" onclick="location.href='/sitemap'">사이트맵</a></li>
            <li><a href="#">리쿠르트</a></li>
            <li><a href="#">이용약관</a></li>
            <li class="yellow"><a href="#">개인정보처리방침</a></li>
            <li><a href="#">위치기반서비스 이용약관</a></li>
            <li><a href="#">이메일 무단수집거부</a></li>
            <li><a href="#">법적고지</a></li>
            <li><a href="#">사이트맵</a></li>
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
          <a onclick="location.href='/resources/html/subpage/signin/login.html'">LOGIN</a>
        </div>
      </div>
    </div>
  </body>
</html>
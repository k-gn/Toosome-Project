<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/resources/css/share/reset.css">
  <link rel="stylesheet" href="/resources/css/share/nav_footer.css">
  <link rel="stylesheet" href="/resources/css/subpages/signup/signup.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="shortcut icon" href="/resources/img/AnyConv.com__favicon.ico" type="image/x-icon">
  <script src="resources/js/share/jquery-3.1.1.js"></script>
  <script src="resources/js/share/nav_footer.js"></script>
  <!-- 우편번호 api -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/resources/js/subpages/signup/signup.js" defer></script>
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
            <li><a onclick="location.href='/signin'">LOGIN</a></li>
         	<li><a onclick="location.href='/agreement'">SIGN UP</a></li>
            <li><a href="#">FAQ</a></li>
        </ul>
    </header>
    <!-- Header End -->

    <!-- Section Start -->
    <section>
      <div class="signup-container">
        <div class="title-container">
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="#">
          <span class="signup-title">회원가입</span>
        </div>
        <form class="signup-form-container" action="#">
          <div class="signup-wrapper">
            <div class="signform-email-wrapper">
              <span>이메일</span>
              <input class="email-auth-btn" type="button" value="이메일 인증" disabled="disabled">
            </div>
            <input class="signup-form email" type="email" name="email" placeholder="이메일 주소를 입력해주세요">
            <p class="validation email"></p>
            <p class="email-auth-ok">인증 완료</p>
          </div>
          <div id="email-auth-form">
            <div class="auth-info-wrapper">
              <p class="email-auth-info">입력하신 이메일 주소로 인증번호가 발송되었습니다.<br>
                  인증번호를 입력하신 후 확인 버튼을 눌러주세요.</p>
              <label class="email-auth-time">02:59</label>
            </div>
            <div class="signup-wrapper">
              <div class="signform-email-wrapper">
                <span>인증번호 입력</span>
                <input class="submit-auth-btn" type="button" value="확인" disabled="disabled">
              </div>
              <input class="signup-form auth" type="text" name="auth" placeholder="이메일 주소를 입력해주세요">
              <p class="validation auth"></p>
            </div>
          </div>
          <div class="signup-wrapper">
            <span>비밀번호</span>
            <input class="signup-form pwd1" type="password" name="password" placeholder="비밀번호를 입력해주세요">
            <p class="validation pwd1"></p>
          </div>
          <div class="signup-wrapper">
            <span>비밀번호 재확인</span>
            <input class="signup-form pwd2" type="password" name="repassword" placeholder="비밀번호를 다시 입력해주세요">
            <p class="validation pwd2"></p>
          </div>
          <div class="signup-wrapper">
            <span>이름</span>
            <input class="signup-form name" type="text" name="name" placeholder="이름을 입력해주세요">
            <p class="validation name"></p>
          </div>
          <div class="signup-wrapper">
            <span>생년월일</span>
            <div class="signup-form-tb">
              <input class="signup-form year" type="text" name="year" placeholder="년(4자)">
              <select class="signup-form month" name="month">
                <option value="default" selected>월</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">4</option>
                <option value="4">3</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
              <input class="signup-form date" type="text" name="date" placeholder="일">
            </div>
            <p class="validation birth"></p>
          </div>
          <div class="signup-wrapper">
            <span>전화번호</span>
            <div class="signup-form-tb">
              <select class="signup-form agency" name="phone1">
                <option value="default" selected>010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
              </select>
              <input class="signup-form tel1" type="tel" name="phone2" placeholder="(4자리)">
              <input class="signup-form tel2" type="tel" name="phone3" placeholder="(4자리)">
            </div>
            <p class="validation tel"></p>
          </div>
          <div class="signup-wrapper">
            <span>우편번호</span>
            <div class="signup-form-tb">
              <input class="signup-form postcode" type="text" name="post1" placeholder="(5자리)">
              <input class="post-search" type="button" value="검색">
            </div>
            <p class="validation postcode"></p>
          </div>
          <div class="signup-wrapper">
            <span>주소</span>
            <input class="signup-form addr1" type="text" name="address1" placeholder="주소를 입력해주세요">
            <p class="validation addr1"></p>
          </div>
          <div class="signup-wrapper">
            <span>상세주소</span>
            <input class="signup-form addr2" type="text" name="address2" placeholder="상세 주소를 입력해주세요">
            <p class="validation addr2"></p>
          </div>
          <div class="signform-btn-wrapper">
            <input class="signform-btn" type="button" disabled="disabled" value="회원가입">
          </div>
        </form>
      </div>
    </section>
    <!-- Section End -->

    <!-- Footer Start -->
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
      <!-- Footer End -->
  </div>
 </div>
</body>
</html>
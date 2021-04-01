<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/share/reset.css">
    <link rel="stylesheet" href="/resources/css/share/nav_footer.css">
    <link rel="stylesheet" href="/resources/css/subpages/qna/qnaEnrollment/qnaEnrollment.css">
    <link
      rel="shortcut icon"
      href="/resources/img/AnyConv.com__favicon.ico"
      type="image/x-icon"
    />
  	<script src="/resources/js/share/jquery-3.1.1.js"></script>
  	<script src="/resources/js/share/nav_footer.js"></script>
  	<script src="/resources/js/subpages/qna/qnaEnrollment/qnaEnrollment.js" defer></script>
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
                            <li><a href="#">매장안내</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">
                        <a href="#">WHAT'S NEWS</a>
                        <ul class="sub-con">
                            <li><a href="#">이벤트</a></li>
                            <li><a href="#">멤버쉽&amp;제휴카드</a></li>
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
        <!-- header-end -->
		<!-- section start -->
        <section>
        	<div class="sub-header-container">
        		<h3>QnA</h3>
        		<nav class="navigation-container">
        			<ul>
        				<li><a href="#">HOME</a></li>
        				<li><a href="#">WHAT'S NEWS</a></li>
        				<li><a href="#">QnA</a></li>
        			</ul>
        		</nav>
        	</div>
        	<div class="qna-info-container">
        		<div class="qna-info">
	        		<h3>고객님의 소중한 의견을 들려 주십시오. 작은 소리도 듣겠습니다.</h3>
	        		<p>투썸플레이스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다.<br>
						만족스러운 서비스였는지, 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다.<br>
						보다 나은 서비스로 보답하겠습니다.</p>
					<span>고객의 소리 운영시간 : 09:00~18:00 (연중무휴)</span>
        		</div>
        	</div>
        	<form id="qna-form" action="#">
	        	<div class="qna-type-container">
	        		<span class="title">카테고리</span>
	        		<select name="type">
	        			<option>메뉴문의</option>
	        			<option>상품문의</option>
	        			<option>배송문의</option>
	        			<option>창업문의</option>
	        			<option>기타</option>
	        		</select>
	        	</div>
	        	<div class="qna-title-container">
	        		<span class="title">제목</span>
	        		<input type="text" name="title" placeholder="제목을 입력하세요">
	        	</div>
        		<div class="qna-content-container">
        			<p class="title">내용</p>
        			<textarea name="content" placeholder="내용을 입력하세요"></textarea>
        		</div>
        		<div class="qna-img-container">
        			<span class="title">이미지 첨부</span>
        			<input type="text" id="file-path" readonly>
        			<label for="input-file">업로드</label>
        			<input type="file" name="file" id="input-file" accept="image/*">	
        		</div>
        		<div class="qna-radio-container">
        			<span class="title">공개 범위</span>
        			<input type="radio" name="openScope" value="public" checked>공개
        			<input type="radio" name="openScope" value="private">비공개
        		</div>
        		<div class="qna-pwd-container">
        			<span class="title">비밀번호</span>
        			<input type="password" name="pwd" disabled>
        		</div>
        		<div class="btn-container">
        			<input type="reset" value="초기화">
        			<input type="submit" value="등록" id="submit">
        		</div>
        	</form>
        </section>
		<!-- section end -->
        <!-- footer-start -->
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
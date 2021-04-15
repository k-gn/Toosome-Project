<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/memberShip/memberShip.css">
    <script src="/resources/js/subpages/memberShip/memberShip.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
	    <div class="member-container">
	      <div class="title-container">
	          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
	          <span class="member-title">멤버십 카드</span>
	      </div>
	
	      <div class="contents">
	          <div class="membership-text">
	            <h5 class="mb-logo">
	              <img src="/resources/img/subpages/member/logo_black.png" alt="">
	            </h5>
	            <span class="tit">TOOSOME MEMBERSHIP 이란?</span>
	            <img src="/resources/img/subpages/member/card4.png" alt="" class="card">
	            <p class="comment">
	              TOOSOME MEMBERSHIP은 문화, 외식, 쇼핑, 엔터테인먼트 등<br/>
	              TOOSOME의 다양한 라이프스타일 브랜드가 <strong>하나의 멤버십 서비스</strong><br/>
	              로 통합되어 한 장의 카드로 포인트를 적립/사용하고<br/>
	              TOOSOME에서 제공하는 다양한 혜택을 함께 즐길 수 있는<br/>
	              TOOSOME의 새로운 <strong>통합멤버십 서비스</strong>입니다.
	            </p>
	          </div>
	          <p class="member-text">
	            TOOSOME MEMBERSHIP 혜택
	          </p>
	          <ul class="benefit">
	            <li class="bene-list">
	              <div class="img-box">
	                <img src="/resources/img/subpages/member/img_cjone01_1.gif" alt="">
	              </div>
	              <ul class="benefit-contents">
	                <li><strong>포인트 적립</strong></li>
	                <ul class="true-contents">
	                  <li><strong>결제 금액의 0.5% 적립</strong>
	                    <br/>&nbsp;&nbsp;-모바일 쿠폰 사용 및 제휴/할인 적용 시 0.1% 적립
	                  </li>
	                  <li>영수증 날짜 기준, 결제 당일에 한해 사후 적립 가능 (기존 결제 취소 후 적립)</li>
	                  <li>동일매장 기준 1일 최대 5회까지 적립 가능 (선적립 카드는 최대 3회)</li>
	                  <li>일부 특수점포(마트/병원/휴게소/공항 등)는 TOOSOME MEMBERSHIP 포인트 적립/사용 불가</li>
	                  <li>모바일 쿠폰 및 제휴/할인을 포함하여 결제 시 전체 결제 금액의 0.1% 적립</li>
	                </ul>
	              </ul>
	            </li>
	            <li class="bene-list">
	              <div class="img-box">
	                <img src="/resources/img/subpages/member/img_cjone01_2.gif" alt="">
	              </div>
	              <ul class="benefit-contents">
	                <li><strong>포인트 사용</strong></li>
	                <ul class="true-contents">
	                  <li><strong>1,000포인트 이상 보유시, 10포인트 단위로 현금처럼 사용</strong>
	                    <br/>1포인트는 1원의 가치를 지니며, 투썸플레이스에서는 1,000포인트 이상 보유시 10포인트 단위로 현금처럼 사용 가능합니다.
	                  </li>
	                  <li>포인트 사용시, 반드시 TOOSOME MEMBERSHIP 카드(모바일카드 또는 APP 가능)를 제시하셔야 하며, 10,000 포인트 이상<br/> 사용 시에는 TOOSOME MEMBERSHIP 카드 비밀번호 4자리를 입력해야 포인트 사용이 가능합니다.<br/> (비밀번호는 TOOSOME MEMBERSHIP 페이지-나의 카드에서 입력/설정 가능)</li>
	                </ul>
	              </ul>
	            </li>
	            <li class="bene-list">
	              <div class="img-box">
	                <img src="/resources/img/subpages/member/img_cjone01_3.gif" alt="">
	              </div>
	              <ul class="benefit-contents">
	                <li><strong>보너스포인트 추가적립</strong></li>
	                <ul class="true-contents">
	                  <li><strong>기본 적립 포인트의 50% 또는 100% 추가 적립</strong>
	                    <br/> - 매월 TOOSOME MEMBERSHIP 제휴 브랜드를 4개 이용하시면, 해당 월 총 적립 포인트의 50%를 보너스 포인트로 추가 적립해드립니다.
	                    <br/>(예 : 투썸플레이스, CGV, 올리브영, 오쇼핑에서 한 달동안 총 1,000 포인트 적립시, 익월에 500 포인트 추가 적립.)
	                    <br/>
	                    <br/>- 매월 TOOSOME MEMBERSHIP 제휴 브랜드를 5개 이상 이용하시면, 해당 월 총 적립 포인트의 100%를 보너스 포인트로 추가 적립해드립니다.
	                    <br/>(예 : 투썸플레이스, CGV, 올리브영, 오쇼핑, 뚜레쥬르에서 한 달동안 총 1,000 포인트 적립시, 익월에 1,000 포인트 추가 적립.)
	                  </li>
	                </ul>
	              </ul>
	            </li>
	            <li class="bene-list">
	              <div class="img-box">
	                <img src="/resources/img/subpages/member/img_cjone01_4.gif" alt="">
	              </div>
	              <ul class="benefit-contents">
	                <li><strong>쿠폰 서비스</strong></li>
	                <ul class="true-contents">
	                  <li><strong>내가 사용할 수 있는 쿠폰이 TOOSOME MEMBERSHIP 카드 한 장에 쏘옥~</strong>
	                    <br/>TOOSOME MEMBERSHIP 회원이 되시면 쿠폰 찾아 여기저기 다닐 필요 없이 TOOSOME MEMBERSHIP 제휴 브랜드의 쿠폰을<br/> 카드 한 장에 담아드립니다.
	                  </li>
	                  <li>단, 반드시 TOOSOME MEMBERSHIP 카드를 제시하셔야 쿠폰 사용이 가능합니다.(모바일카드 또는 APP 가능)</li>
	                </ul>
	              </ul>
	            </li>
	            <li class="bene-list">
	              <div class="img-box">
	                <img src="/resources/img/subpages/member/img_cjone01_5.gif" alt="">
	              </div>
	              <ul class="benefit-contents">
	                <li><strong>포인트 선물하기</strong></li>
	                <ul class="true-contents">
	                  <li><strong>포인트를 함께 모아 사용하세요!</strong>
	                    <br/>친구, 가족, 연인과 함께 TOOSOME MEMBERSHIP 회원이 되어 TOOSOME MEMBERSHIP 제휴 브랜드를 이용하시고, 포인트를 선물하거나,
	                    <br/> 선물받은 포인트를 내가 모은 포인트와 함께 사용하세요!
	                  </li>
	                </ul>
	              </ul>
	            </li>
	            <li class="bene-list">
	              <div class="img-box">
	                <img src="/resources/img/subpages/member/img_cjone01_7.gif" alt="">
	              </div>
	              <ul class="benefit-contents">
	                <li><strong>문화공연과 이벤트</strong></li>
	                <ul class="true-contents">
	                  <li><strong>TOOSOME MEMBERSHIP 회원 전용 문화 공연 및 다양한 이벤트 혜택이 가득~</strong></li>
	                </ul>
	              </ul>
	            </li>
	          </ul>
	      </div>
	      <form class="sign-form">
	      	
	      	<div class="check-box-cover">
		    	<span>멤버십 혜택과 이벤트를 읽으셨으면</span>
		      	<input id="ck-box" type="checkbox"/>
		      	<div class="check-box"></div>
	      	</div>
	      	
	      	
	      	<div class="sign-box">
	      		<input id="sign" type="submit" value="멤버십 가입하기" disabled/>
	      	</div>
	      </form>
	      
	    </div>
    	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
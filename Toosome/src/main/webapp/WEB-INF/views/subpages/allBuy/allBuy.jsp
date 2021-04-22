<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/allBuy/allBuy.css">
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="allBuy-container">
      <div class="title-container">
          <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
          <span class="allBuy-title">기업 및 단체 구매 안내</span>
      </div>

      <div class="contents">
        <p class="sub-title">
          투썸플레이스에서는 품격있는 다양한 상품을 통해 기업 및 단체 고객에게 최적화된 서비스를 제공 드리고 있습니다.
        </p>

        <h2 class="title-content">
          투썸플레이스에서 판매하고 있는 다양한 상품의 대량 구매 및 상담을 도와드립니다.
        </h2>
        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/allBuy/all-buy.PNG" alt="" class="pic">
        
        <div class="guide">
          <p class="guide-title">
            <strong>기업 및 단체 구매 상담 안내</strong>
          </p>
          <ul class="guide-content">
            <li>구매 상담 운영시간 : 월~금 09:00 ~ 17:00 (12:30~13:30 제외, 토·일요일, 공휴일 휴무)</li>
            <li>상품 구매 및 상담 문의 : 이메일 (twosomebiz@twosome.co.kr), 전화 (02-2058-6568)</li>
            <li>이메일 또는 유선문의 주시면 대량 구매에 따른 혜택 등 자세한 사항 안내 드립니다.</li>
            <li>답변 및 안내는 상담 운영시간 내에 이메일 또는 전화번호로 안내 드립니다.</li>
            <li>기재 오류시 답변이 불가할 수 있으니 기재 시 꼭 메일주소 및 전화번호를 확인해 주시기 바랍니다.</li>
          </ul>
        </div>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/product/productDetail/productDetail.css">
  <script src="/resources/js/subpages/menuDetail/menuDetail.js"></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="productDetail-container">      
      <div class="contents">
        <img class="product-img" src="/resources/img/subpages/product/productDetail/p02.png" alt="">
        <ul class="star">
          <li><img src="/resources/img/subpages/product/productDetail/ico_star_off.png" alt=""></li>
          <li>TOOSOME a-LIST CAPSULE COFFEE VARIETY GIFT PACK</li>
          <li class="strong">투썸 에이리스트 캡슐커피 버라이어티 기프트팩</li>
          <li class="title-text">투썸의 노하우로 만들어진 3가지 원두를 모두 즐길 수 있는 시즌한정 버라이어티팩</li>
          <li class="product-pay"><span>1000 원</span></li>
          <li class="order-btn">
            <input type="button" class="online" value="온라인주문">
            <input type="button" class="basket" value="장바구니 담기">
          </li>
        </ul>
        
      
        <ul class="notice-box">
          <li>※ 상기 이미지는 실제 제품과 다소 차이가 있을 수 있습니다. (토핑 과일은 계절에 따라 달라질 수 있습니다.)</li>
          <li>※ 제품의 취급여부는 매장별로 상이할 수 있습니다.</li>
        </ul>

        <div class="comment-box">
          
          <div class="precaution">
            <h3 class="pretitle">주문 시 유의 사항</h3>
            <ul class="precau">
              <li class="prelist"><span class="redbold">주문 안내</span>
                <ul class="one">
                  <li>배송제품 주문시에는 <strong>배송비 3,000원(배송지당)이 추가로 부가</strong>됩니다.</li>
                  <li>주문일로부터 약 3~4일 후에 제품을 수령하실 수 있으나, 명절이나 특수기 및 택배 사정 등으로 다소 지연될 수 있습니다.</li>
                  <li>배송 여부는 로그인 후 우측상단의 마이투썸>온라인 주문정보에서 확인이 가능합니다.</li>
                  <li>보호자(법정대리인)의 동의가 없는 미성년자의 주문은 미성년자 본인 또는 보호자(법정대리인)가 취소할 수 있습니다.</li>
                </ul>
              </li>
              <li class="prelist"><span class="redbold">교환/환불 안내</span>
                <ul class="one">
                  <li>제품에 이상이 있는 경우, 투썸플레이스 <strong>신논현점(TEL. 02-540-2388)</strong>으로 연락 주시기 바랍니다.</li>
                  <li>
                    단, 소비자 단순변심 및 부주의에 의해 훼손된 제품에 대해서는 보상의 책임을 지지 않습니다.<br/>
                    소비자 단순변심에 의한 청약철회의 경우, 이에 따른 상품 반환 비용은 고객님께서 부담하셔야 합니다.
                  </li>
                </ul>
              </li>
              <li class="prelist"><span class="redbold">TOOSOME MEMBERSHIP 포인트 적립 및 사용 안내</span>
                <ul class="one">
                  <li>1,000포인트 이상 시 10포인트 단위로 사용할 수 있습니다.</li>
                  <li>주문일로부터 약 3~4일 후에 제품을 수령하실 수 있으나, 명절이나 특수기 및 택배 사정 등으로 다소 지연될 수 있습니다.</li>
                  <li>
                    결제 금액의 0.5%에 대하여 TOOSOME MEMBERSHIP 포인트를 적립해 드립니다.<br/>
                    (포인트 결제 금액을 제회한 나머지 결제금액에 대해서만 TOOSOME MEMBERSHIP 포인트가 적립됩니다.)
                  </li>
                </ul>
              </li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="prev">&lt;</button>
            <button class="list">목록</button>
            <button class="next">&gt;</button>
          </div>
            
          <ul class="one-comment">
            <li class="bold">
              COMMENT 맛있는 제품 한마디
            </li>
            <li class="thin">
              ※ 게시판 성격과 맞지 않거나, 비방글은 언제든지 삭제될 수 있습니다.
            </li>
          </ul>

          <form action="#" method="post" class="form1">
            <div class="star-catch-cover">
              <div class="star-catch">
                <p class="star_img star"><img src="/resources/img/subpages/product/productDetail/ico_star_5.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_4.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_2.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></p>
              </div>

              <div class="triangle-cover">
                ▼
              </div>
              
              <ul class="star-drop">
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_5.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_4.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_2.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></a></li>
              </ul>
            </div>

            <input type="text" placeholder="제품 한마디를 등록해 주세요.">
            <input type="submit" value="쓰기">

          </form>
          <form action="#" method="get" class="form2">
            
            <ul class="comment-end">
              <li>
                <span class="star-fin"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></span>
                <span class="cocom">불량식품 맛 나요..ㅡㅡ</span>
                <span class="nik">admin**</span>
                <span class="dat">2021.04.02</span>
              </li>
              <li>
                <span class="star-fin"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></span>
                <span class="cocom">달달하니 좋네용용용</span>
                <span class="nik">Tommy.Lee**</span>
                <span class="dat">2021.04.01</span>
              </li>
            </ul>
          </form>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
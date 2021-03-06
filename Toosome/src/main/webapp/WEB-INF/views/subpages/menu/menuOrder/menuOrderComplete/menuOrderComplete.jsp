<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <link rel="stylesheet" href="/resources/css/subpages/menu/menuOrder/menuOrderComplete/menuOrderComplete.css">
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
  	<!-- 결제 완료 페이지 -->
    <section>
      <p>결제 완료</p>
      <!-- 주문 상단 아이콘 -->
      <div class="process-container">
        <div>
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/complete.png" alt="#">
          <span>결제완료</span>
        </div>
      </div>
      <p class="pay-title">결제 완료가 되었습니다.</p>
      <!-- 주문자 정보 확인 -->
      <div id="order1" class="order">
        <p class="order-title"><span class="big">01.</span><strong>주문하시는 분</strong></p>
        <form id="or1" action="#" method="post" name="form1">
          <div class="or1-wrap">
            <table class="table table-borderless">
              <tbody>
                <tr>
                  <td>
                    주문자
                  </td>
                  <td>
                    <input type="text" name="orderName" id="orderName" value="${memberOrderCompleteList.memberName}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <input type="text" name="orderName" id="orderName" placeholder="01012341234" value="${memberOrderCompleteList.memberPhone}" disabled>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>
      </div>
      <!-- 결제내용 확인 -->
      <div class="total-test">
        <p class="order-title"><span class="big">02.</span><strong>결제내용</strong></p>
        <table class="table">
          <tbody>
            <tr>
              <td>
                상품명
              </td>
              <td>
                <span class="menu-title">${menuOrderCompleteList.menuMainTitle}</span>
              </td>
            </tr>
            <tr>
              <td>
                상품금액
              </td>
              <td>
                <div class="pay-box">
                  <span class="com" style="float: left;">${menuOrderCompleteList.menuPrice}</span>
                  <span style="float: left;">&nbsp;원</span>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="re-point">${sPoint}</span> P
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="discount-pay com">${salprice}</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue com">${menusalt}</span>원</td>
            </tr>
            <tr>
              <td>사용한 포인트 </td>
              <td>
                <span class="use-point com">${usedPoint}</span> P
              </td>
            </tr> 
          </tbody>
        </table>
        <div class="pay-do">
          <p class="txt-red"> 최종 결제된 금액 : <span class="com">${menuEndPrice}</span> 원</p>
        </div>
        <div class="out-btn">
          <a href="/">MAIN</a>
          <a href="/menu-new">구매계속하기</a>
        </div>
      </div>
    </section>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
 </div>
  
<script>
  // 1000단위마다 , 찍기
  const coms = document.querySelectorAll('.com');
  coms.forEach((com => {
      let num = +(com.innerHTML);
      com.innerHTML = num.toLocaleString('en');
  }))
</script>
</body>
</html>
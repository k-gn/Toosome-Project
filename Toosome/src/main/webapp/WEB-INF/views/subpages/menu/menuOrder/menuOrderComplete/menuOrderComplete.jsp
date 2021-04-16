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
<title>Insert title here</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
  
    <section>
      <p>결제 완료</p>
      <div class="process-container">
        <div>
          <img src="/resources/img/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="/resources/img/subpages/basket/complete.png" alt="#">
          <span>결제완료</span>
        </div>
      </div>
      <p class="pay-title">결제 완료가 되었습니다.</p>
      
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
                    <input type="text" name="orderName" id="orderName" value="홍길동" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <input type="tel" name="phone1" id="tel2" value="010" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel3" value="1111" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel4" value="1111" disabled>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>
      </div>
      
      <div class="total-test">
        <p class="order-title"><span class="big">02.</span><strong>결제내용</strong></p>

        <table class="table">
          <tbody>
            <tr>
              <td>
                상품명
              </td>
              <td>
                <span class="menu-title">딸기 음료</span>
              </td>
            </tr>
            <tr>
              <td>
                상품금액
              </td>
              <td>
                <div class="pay-box">
                  <span class="com" style="float: left;">4000</span>
                  <span style="float: left;">&nbsp;원</span>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="re-point">40</span> P
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="discount-pay com">1000</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue com">3000</span>원</td>
            </tr>
            <tr>
              <td>사용한 포인트 </td>
              <td>
                <span class="use-point com">3000</span> P
              </td>
            </tr> 
          </tbody>
        </table>
        <div class="pay-do">
          <p class="txt-red"> 최종 결제된 금액 : <span class="com">0</span> 원</p>
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
  const coms = document.querySelectorAll('.com');
  coms.forEach((com => {
      let num = +(com.innerHTML);
      com.innerHTML = num.toLocaleString('en');
  }))
</script>
</body>
</html>
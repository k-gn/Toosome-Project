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
  <link rel="stylesheet" href="/resources/css/subpages/menu/menuOrder/menuOrder.css">
  <script src="/resources/js/subpages/basket/menu/menuOrder/menuOrder.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
<div id="container">
  <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
  <section>
      <p>주문 / 결제</p>
      <div class="process-container">
        <div>
          <img src="/resources/img/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="/resources/img/subpages/basket/complete.png" alt="#">
          <span>주문완료</span>
        </div>
      </div>
      
      <div class="menu-content">
        <img src="/resources/img/subpages/product/b05.png" alt="">
        <p class="menu-text">${menuOrderList.menuMainTitle}</p>
        <div class="pay-box">
          <span class="com">${menuOrderList.menuPrice}</span>
          <span>&nbsp;원</span>
        </div>
      </div>

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
                    <input type="text" name="orderName" id="orderName" placeholder="ex)홍길동" value="${memberOrderList.memberName} " required>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <select name="phone1" id="tel">
                      <option value="010" selected>010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="017">017</option>
                      <option value="018">018</option>
                      <option value="019">019</option>
                    </select>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel3" placeholder="1234" required>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel4" placeholder="1234" required>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
        </form>
      </div>
      
      <div class="total-test">
        <p class="order-title"><span class="big">02.</span><strong>결제금액 확인</strong></p>

        <table class="table table-borderless">
          <tbody>
            <tr>
              <td>
                상품금액
              </td>
              <td>
                <div class="pay-box">
                  <span class="com" style="float: left;">${menuOrderList.menuPrice}</span>
                  <span style="float: left;">&nbsp;원</span>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="re-point">0</span> P
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="discount-pay com">0</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue com">${menuOrderList.menuPrice}</span>원</td>
            </tr>
            <tr>
              <td> 포 인 트 </td>
              <td>
                사용가능 포인트 : <span name="left_pnt">12345678</span>p <span><br/>
                <input type="checkbox" id="chk_use" onclick="chkPoint(3000,12345678,3000,100)">&nbsp;포인트 전체 사용</span>
                <span style="color: #ff0000; font-size: 16px;">(포인트는 최소 3,000p부터 100p단위로 사용 가능합니다.)</span>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span> <input type="number" name="use_pnt" id="use_pnt" min="3000" onchange="changePoint(3000,12345678,3000,100)"></span> p 
                <span> ( 남은포인트 : </span><span name="left_pnt" id="left_pnt">12345678</span>p )
              </td>
            </tr>
                
          </tbody>
        </table>
        <div class="pay-do">
          <p class="txt-red"> 최종 결제 금액 : <span class="bold txt_red com" id="result_pnt">3000</span> 원</p>
          <!-- <input type="submit" value="결제하기"> -->
          <a href="/import1?menuId=${menuOrderList.menuId}">결제하기</a>
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
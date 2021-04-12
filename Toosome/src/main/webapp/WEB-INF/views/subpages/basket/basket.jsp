<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/basket/basket.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="/resources/js/subpages/basket/basket.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
        <section>
      <p>장바구니</p>
      <div class="process-container">
        <div>
          <img src="/resources/img/subpages/basket/basket.png" alt="#">
          <span>장바구니</span>
        </div>
        <div>
          <img src="/resources/img/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="/resources/img/subpages/basket/complete.png" alt="#">
          <span>주문완료</span>
        </div>
      </div>
      <div class="table-box">
        <table class="table text-center">
          <thead>
            <tr class="table-secondary">
              <th><input type="checkbox" class="c-box" name="checkAll" id="checkAll" onclick="selectAll(this)"></th>
              <th colspan="2">주문 품목</th>
              <th>수량</th>
              <th>적립 포인트</th>
              <th>할인 금액</th>
              <th>결제금액</th>
              <th>삭제</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="checkbox" class="c-box" name="check" onclick="checkSelectAll()"></td>
              <td><img src="" alt=""></td>
              <td><span class="name"></span></td>
              <td>
                <input type="number" min="1" max="10" name="quantity" value="1" id="quantity"/>
              </td>
              <td>
                <span class="point"></span>
              </td>
              <td>
                <span class="discount"></span>
              </td>
              <td>
                <span class="total"></span>
              </td>
              <td>
                <input type="button" value="X" onclick="deleteRow(this);">
              </td>
            </tr>

            <tr>
              <td><input type="checkbox" class="c-box" name="check" onclick="checkSelectAll()"></td>
              <td><img src="" alt=""></td>
              <td><span class="name"></span></td>
              <td>
                <input type="number" min="1" max="10" name="quantity" value="1" id="quantity"/>
              </td>
              <td>
                <span class="point"></span>
              </td>
              <td>
                <span class="discount"></span>
              </td>
              <td>
                <span class="total"></span>
              </td>
              <td>
                <input type="button" value="X" onclick="deleteRow(this);">
              </td>
            </tr>

          </tbody>
        </table>
      </div>
      <div class="total-table">
        <p class="total-title">총 주문 금액</p>

        <table class="table">
          <tbody>
            <tr>
              <td>
                주문상품 수
              </td>
              <td>
                <span class="product-count">2개</span>
              </td>
            </tr>
            <tr>
              <td>
                주문 금액
              </td>
              <td>
                <span class="product-pay">7,980</span> 원
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="product-discount">0</span> 원
              </td>
            </tr>
            <tr>
              <td>
                배송비
              </td>
              <td>
                <span class="product-delivery">0</span> 원
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="product-point">0</span> 점
              </td>
            </tr>
            <tr class="final-pay">
              <td>
                최종 결제 금액
              </td>
              <td>
                <span class="product-total">7,980</span> 원
              </td>
            </tr>

          </tbody>
        </table>
      </div>
      <div class="order-container"></div>
      <div class="btn-box">
        <button>계속 쇼핑하기</button>
        <button>선택상품구매</button>
        <button onclick="location.href='/order'">전체상품구매</button>
      </div> 		 	
    </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
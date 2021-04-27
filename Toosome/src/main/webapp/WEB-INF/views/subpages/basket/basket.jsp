<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>	
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
      <form action="#" class="section">
        <p>장바구니</p>
        <div class="process-container">
          <div>
            <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/basket.png" alt="#">
            <span>장바구니</span>
          </div>
          <div>
            <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/payment.png" alt="#">
            <span>주문/결제</span>
          </div>
          <div>
            <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/complete.png" alt="#">
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
                <th>상품명</th>
                <th>상품가격</th>
                <th>삭제</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="basket" items="${baskets}" varStatus="i">
              <tr>
                <td><input type="checkbox" class="c-box" name="check" onclick="checkSelectAll()"></td>
                <td style="width: 150px;"><img style="display: block; width: 150px; height: 150px;" src="${basket.imagePath}" alt=""></td>
                <td><span class="name"></span></td>
                <td>
                  <input type="number" min="1" max="10" name="quantity${i.count}" value="${basket.basketAmount}" id="quantity" oninput="modBasket(${i.count}, ${basket.basketId})"/>
                </td>
                <td>
                  <span class="pname">${basket.basketName}</span>
                </td>
                <td>
                  <span class="price">${basket.basketPrice}원</span>
                </td>
                <td>
                  <input type="button" value="X" onclick="deleteRow(this, ${basket.basketId});">
                </td>
              </tr>
            </c:forEach>
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
                  <span class="product-count">${basketUtil.amount}개</span>
                </td>
              </tr>
              <tr>
                <td>
                  주문 금액
                </td>
                <td>
                  <span class="product-pay"><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketUtil.total}" /></span> 원
                </td>
              </tr>
              <tr>
                <td>
                  할인 금액
                </td>
                <td>
                  <span class="product-discount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketUtil.discount}" /></span> 원
                </td>
              </tr>
              <tr>
                <td>
                  배송비
                </td>
                <td>
                  <span class="product-delivery"><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketUtil.deliveryPay}" /></span> 원
                </td>
              </tr>
              <tr>
                <td>
                  적립 포인트
                </td>
                <td>
                  <span class="product-point"><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketUtil.point}" /></span> 점
                </td>
              </tr>
              <tr class="final-pay">
                <td>
                  최종 결제 금액
                </td>
                <td>
                  <span class="product-total"><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketUtil.realPayment}" /></span> 원
                </td>
              </tr>

            </tbody>
          </table>
        </div>
        <div class="order-container"></div>
        <div class="btn-box">
          <input type="button" class="button" value="계속 쇼핑하기" onclick="location.href='/product-new'">
          <input type="button" class="button" value="상품구매" onclick="location.href='/basket/order'">
        </div> 
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
    </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
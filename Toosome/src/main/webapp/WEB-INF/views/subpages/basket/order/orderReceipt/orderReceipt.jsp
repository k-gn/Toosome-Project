<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/basket/order/orderReceipt/orderReceipt.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/subpages/basket/order/orderReceipt/orderReceipt.js" defer></script>
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <section>
      <p class="title">주문 내역 / 주문 취소</p>
      
      <div class="smart-post">
      	<p class="post-title">배송 상태</p>
        <ul class="post-text">
        	<li class="one">
        		<p class="one-text">결제완료</p>
        		<span></span>
        	</li>
        	<li class="two">
        		<p class="two-text">접수완료</p>
        		<span></span>
        	</li>
        	<li class="three">
        		<p class="three-text">배송준비중</p>
        		<span></span>
        	</li>
        	<li class="four">
        		<p class="four-text">배송중</p>
        		<span></span>
        	</li>
        	<li class="five">
        		<p class="five-text">배송완료</p>
        		<span></span>
        	</li>
        </ul>
        <form>
			<input class="data" type="text" value=""/>
        </form>
      </div>
      
      <c:forEach var="orderList" items="${orderList}" varStatus="i">
	      <div class="table-cover">
	        <table class="table">
	          <thead class="text-center">
	            <tr>
	              <th scope="col">상품명</th>
	              <th scope="col">수량</th>
	              <th scope="col">날짜</th>
	              <th scope="col">배송비</th>
	              <th scope="col">총금액</th>
	              <th scope="col">비고</th>
	            </tr>
	          </thead>
	          <tbody class="top-table">
	            <tr class="top-table-pick">
	              <td><span class="total-name">${orderList.ordersProductName}</span></td>
	              <td><span class="total-count">${orderList.ordersAmount}</span></td>
	              <td><span class="total-day">${orderList.ordersOrderDate}</span></td>
	              <td><span class="total-post-pay">${orderList.ordersDelivery}</span>원</td>
	              <td><span class="total-pay">${orderList.ordersPayment}</span>원</td>
	              <td>
	                <ul>
	                  	<li><a href="#" onclick="cancelPay(${orderList.ordersId});">주문취소</a></li>
                  		<li><a href="#" onclick="lookPost(${orderList.ordersId})">배송상태보기</a></li>
	                </ul>
	              </td>
	            </tr>
	          </tbody>
	        </table>
	        
	        <button class="under-btn" onclick="viewContent(${orderList.ordersId});">내용보기</button>
	        
	        <table class="table none">
	        	<tbody class="under-table a${orderList.ordersId}">
	        		
	        	</tbody>
	        </table>
      </div>
      </c:forEach>
      <div class="text">
                        ※ <span class="red-text">배송중</span>이면 주문취소가 안됩니다!!!
        <p class="sub-text">
          <span class="bold-text">"결제완료" &amp; "상품준비중"</span>의 상태의 경우,  로그인 후, 마이페이지 &gt; 주문내역 &gt; 주문취소 선택 시 가능 합니다.<br/>
          <br/>
          <span class="bold-text">"배송준비중"</span>인 상태에서는 제품 포장되어 출고 과정에 있기에 취소처리가 어려움을 알려드립니다. 반품 또는 환불을 원하신다면 신논현점(02-540-2388)으로 문의 주시기 바랍니다.<br/>
        </p>
      </div>
      
      <ul class="btn-group">
        <li><a class="payback" href="#">주문취소</a></li>
        <li><a class="main" href="#">MAIN</a></li>
      </ul>
      
    </section>
    
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>

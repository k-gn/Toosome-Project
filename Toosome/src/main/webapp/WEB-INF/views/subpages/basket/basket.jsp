<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/basket/basket.css">
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
   			<table>
   				
   			</table> 
   			<div class="order-container"></div>
   			<div class="btn-box">
   				<button>계속 쇼핑하기</button>
   				<button>선택상품구매</button>
   				<button>전체상품구매</button>
   			</div> 		 	
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
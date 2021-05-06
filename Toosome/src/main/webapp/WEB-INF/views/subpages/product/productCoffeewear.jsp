<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/product/product.css">
  <script src="/resources/js/subpages/product/product.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
<!-- 상품 메뉴 페이지 -->
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>   
    <div class="product-container">
      <div class="title-container">
          <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
      </div>
	  <div class="sub-header-container">
		<h3>PRODUCT</h3>
		<!-- 상품 navigation -->
		<div class="navigation-container">
			<ul>
				<li><a href="/">HOME</a></li>
				<li><a href="/menu-new">MENU</a></li>
				<li><a href="/menu-new">메뉴</a></li>
				<li><a href="/menu-new">커피웨어/기타</a></li>
			</ul>
		</div>
      </div>
      <!-- 상품 퀵 메뉴 -->
      <div class="contents">
        <div class="contents-top">
          <ul class="menu-tab">
            <li><a href="/product-new">NEW</a></li>
            <li><a href="/product-coffee">커피상품</a></li>
            <li class="click"><a href="/product-coffeewear">커피웨어/기타</a></li>
            <li><a href="/product-gift">기프트세트</a></li>
          </ul>
        </div>
    	<!-- 상품 이미지 출력 -->
        <div class="product-box">
			<ul class="all">
				<c:forEach var="productCoffeewearList" items="${productCoffeewearList}">
					<li>
					  <!-- 상품 Id -->
						<a href="/productDetail?productId=${productCoffeewearList.productId}">
							<!-- 상품 이미지 -->
							<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${productCoffeewearList.productImageVO.productImageRoute}/${productCoffeewearList.productImageVO.productImageName}.${productCoffeewearList.productImageVO.productImageExtention}" alt="">
							<!-- 만약 상품이 신메뉴일 경우 -->
							<c:if test="${productCoffeewearList.productNew == 1}">
							  <!-- new 딱지 배치 -->
							  <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/product/ico_new.png" alt=""/>
							</c:if>
							<!-- 만약 상품재고가 없을 경우 -->
							<c:if test="${productCoffeewearList.productState == 2}">
							  <!-- soldout이미지 배치 -->
							  <img class="sold" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/product/soldOut.png" alt=""/>
							</c:if>
							<!-- 상품 이름 -->
							<span>${productCoffeewearList.productTitleName}</span>
							<!-- 상품의 금액 -->
							<div class="pay-box">
								<span class="com" style="float: left;">${productCoffeewearList.productPrice}</span>
								<span style="float: left;">&nbsp;원</span>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
         
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>

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
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>   
    <div class="product-container">
      <div class="title-container">
          <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
      </div>
	  <div class="sub-header-container">
		<h3>PRODUCT</h3>
		<div class="navigation-container">
			<ul>
				<li><a href="/">HOME</a></li>
				<li><a href="/menu-new">MENU</a></li>
				<li><a href="/menu-new">메뉴</a></li>
				<li><a href="/menu-new">커피웨어/기타</a></li>
			</ul>
		</div>
      </div>
      <div class="contents">
        <div class="contents-top">
          <ul class="menu-tab">
            <li><a href="/product-new">NEW</a></li>
            <li><a href="/product-coffee">커피상품</a></li>
            <li class="click"><a href="/product-coffeewear">커피웨어/기타</a></li>
            <li><a href="/product-gift">기프트세트</a></li>
          </ul>
        </div>
    	
        <div class="product-box">
					<ul class="all">
						<c:forEach var="productCoffeewearList" items="${productCoffeewearList}">
							<li>
								<a href="/productDetail?productId=${productCoffeewearList.productId}">
									<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${productCoffeewearList.productImageVO.productImageRoute}/${productCoffeewearList.productImageVO.productImageName}.${productCoffeewearList.productImageVO.productImageExtention}" alt="">
									<c:if test="${productCoffeewearList.productNew == 1}">
									  <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/product/ico_new.png" alt=""/>
									</c:if>
									<c:if test="${productCoffeewearList.productState == 2}">
									  <img class="sold" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/product/soldOut.png" alt=""/>
									</c:if>
									<span>${productCoffeewearList.productTitleName}</span>
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

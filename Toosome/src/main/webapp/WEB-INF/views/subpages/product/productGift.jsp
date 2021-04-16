<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
          <span class="product-title">상품</span>
      </div>

      <div class="contents">
        <div class="contents-top">
          <ul class="menu-tab">
            <li><a href="/product">NEW</a></li>
            <li><a href="/product2">커피상품</a></li>
            <li><a href="/product3">커피웨어/기타</a></li>
            <li class="click"><a href="/product4">기프트세트</a></li>
          </ul>
        </div>
    	
        <div class="product-box">
					<ul class="all">
						<c:forEach var="productGiftList" items="${productGiftList}">
							<li>
								<a href="/productDetail?productId=${productGiftList.productId}">
									<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${productGiftList.productImageVO.productImageRoute}/${productGiftList.productImageVO.productImageName}.${productGiftList.productImageVO.productImageExtention}" alt="">
									<span>${productGiftList.productTitleName}</span>
									<div class="pay-box">
										<span class="com" style="float: left;">${productGiftList.productPrice}</span>
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

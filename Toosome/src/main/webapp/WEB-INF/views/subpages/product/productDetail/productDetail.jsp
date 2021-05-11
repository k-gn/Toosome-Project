<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
<link rel="stylesheet"
	href="/resources/css/subpages/product/productDetail/productDetail.css">
<script src="/resources/js/subpages/menuDetail/menuDetail.js"></script>
<script src="/resources/js/subpages/product/product.js"></script>
<title>A TOOSOME PLACE</title>
</head>

<body>

	<div id="container">
		<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

	<div class="productDetail-container">
		<div class="title-container">
			<c:if test="${productDetail.productType == 1}">
				<span class="productDetail-title big">커피상품</span>
			</c:if>
			<c:if test="${productDetail.productType != 1}">
				<span class="productDetail-title">커피상품</span>
			</c:if>
			<c:if test="${productDetail.productType == 2}">
			 	<span class="productDetail-title big">커피웨어 / 기타</span>
			</c:if>
			<c:if test="${productDetail.productType != 2}">
			 	<span class="productDetail-title">커피웨어 / 기타</span>
			</c:if>
			<c:if test="${productDetail.productType == 3}">
			    <span class="productDetail-title big">기프트세트</span>
			</c:if>
			<c:if test="${productDetail.productType != 3}">
			    <span class="productDetail-title">기프트세트</span>
			</c:if>
		</div>
			<div class="contents">

				<img class="product-img"
					src="https://toosome.s3.ap-northeast-2.amazonaws.com/${productDetail.productImageVO.productImageRoute}/${productDetail.productImageVO.productImageName}.${productDetail.productImageVO.productImageExtention}"
					alt="">

				<ul class="star cf">
					<li><img
						src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_${productDetail.productStar}.png"
						alt=""></li>
						
					<li>${productDetail.productSubName}</li>
				</ul>
				<p class="strong">${productDetail.productTitleName}</p>
				<p class="product-pay">
					<span class="com">${productDetail.productPrice}</span> 원
				</p>
				<p class="title-text">${productDetail.productContent}
				<p>
				<ul class="order-btn cf">
					<!-- <li><a href="/basket?productId=${productDetail.productId}"
						class="online">온라인 주문</a></li> -->
					<li><a class="basket"
						onclick="AddToCart('${productDetail.productId}')">장바구니 담기</a></li>

				</ul>

				<ul class="notice-box">
					<li>${productDetail.productPrecautionsVO.productPrecautionsContent}</li>

				</ul>
				

				<div class="comment-box">

					<div class="precaution">
						<h3 class="pretitle">${productDetail.productPrecautionsVO.productPrecautionsTitle}</h3>
						<ul class="precau">
							<li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName1}</span>
								<ul class="one">
									<li>${productDetail.productPrecautionsVO.productPrecautionsContent1}</li>
								</ul></li>
							<li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName2}</span>
								<ul class="one">
									<li>${productDetail.productPrecautionsVO.productPrecautionsContent2}
									</li>
								</ul></li>
							<li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName3}</span>
								<ul class="one">
									<li>${productDetail.productPrecautionsVO.productPrecautionsContent3}

									</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="btn-group">
						<button class="list" onclick="location.href='/productNew'">목록</button>
					</div>

					<ul class="one-comment">
						<li class="bold">COMMENT 맛있는 제품 한마디</li>
						<li class="thin">※ 게시판 성격과 맞지 않거나, 비방글은 언제든지 삭제될 수 있습니다.</li>
					</ul>
	
        	<form action="/productReviewInsert" method="POST" class="form1" id="productReviewInsert" name="productReviewform1">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input name="productId"  type="hidden" value="${productDetail.productId}" />
	        	<input name="memberId" type="hidden" value="${id}"/>
	        	<input name="productReviewBoardWriter" type="hidden" value="${auth == 'ROLE_USER' ? name : '관리자'}"/>
				<input id="productReviewBoardContent" type="text" name="productReviewBoardContent" placeholder="제품 한마디를 등록해 주세요."> 
				<input type="submit" id="check()" value="쓰기">
	        	
        		<div class="star-catch-cover">
							<div class="star-catch">
								<p class="star_img star">
									<img id="starimg5" 
										onclick=mark(5) onload=mark(5) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png">
								</p>
								<p class="star_img">
									<img id="starimg4"
										onclick=mark(4) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png">
								</p>
								<p class="star_img">
									<img id="starimg3"
										onclick=mark(3) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png">
								</p>
								<p class="star_img">
									<img id="starimg2"
										onclick=mark(2) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png">
								</p>
								<p class="star_img">
									<img id="starimg1"
										onclick=mark(1) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png">
								</p>
							</div>

							<div class="triangle-cover">▼</div>

							<ul class="star-drop">
								<li><a href="#"><img id="starimg5"
										onclick=mark(5)
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg4"
										onclick=mark(4)
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg3"
										onclick=mark(3)
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg2"
										onclick=mark(2)
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg1"
										onclick=mark(1)
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png"
										alt=""></a></li>
							</ul>
							<input id="productReviewBoardRating" type="hidden" name="productReviewBoardRating" />
					</div>
        		</form>
        			<ul class="comment-end">
        			
        			<c:forEach var="productReviewList" items="${productReviewList}" varStatus="status">
		        		<form method="get" class="form2" id="productReviewLists" >
		        			<input name="productId"  type="hidden" value="${productDetail.productId}" />
		        			<input name="memberId" type="hidden" value="${id}"/>
	        				<input name="productReviewBoardId"  type="hidden" value="${productReviewList.productReviewBoardId}" />							        	
					        <input name="productReviewBoardWriter" type="hidden" value="${auth == 'ROLE_USER' ? name : '관리자'}"/>
			        		
			        		<div class="c-test">
								<span class="star-fin"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_${productReviewList.productReviewBoardRating }.png" alt=""></span>
								<c:if test="${productReviewList.memberId != sessionScope.id }">
								<span class="cocom">${productReviewList.productReviewBoardContent}</span> 
								</c:if>
								<c:if test="${productReviewList.memberId == sessionScope.id }">
								<span class="cocom"><input class="productReviewBoardContent" type="text" name="productReviewBoardContent" value="${productReviewList.productReviewBoardContent}"></span>
								</c:if>
								<span class="nik">${productReviewList.productReviewBoardWriter}</span>
								<span class="dat"><fmt:formatDate value="${productReviewList.productReviewBoardRegDate}" pattern="yyyy.MM.dd" /></span>
								
								
								<div class="c-btn">
									<c:if test="${productReviewList.memberId == sessionScope.id }">
										<span><button id="productReviewDelBtn${status.count}" type="submit"  formaction="/productReviewDelete" >삭제</button></span>
								        <span><button id="productReviewUpdBtn${status.count}" type="submit" formaction="/productReviewUpdate" >수정</button></span>
										
									</c:if>
								</div>
							</div>
	
						</form>
					   </c:forEach>
					</ul>	
						
				   


<script type="text/javascript">
//별점 점수 기능
var locked = 0;

function show(productReviewBoardRating){
	if(locked)
		return;
	var i;
	var starimg;
	for(i=1; i<=productReviewBoardRating; i++){
		starimg = 'starimg'+i;
		el = document.getElementById(starimg);	
	}
}

function lock(productReviewBoardRating){
	show(productReviewBoardRating);
	locked=1;
}
function mark(productReviewBoardRating){
	lock(productReviewBoardRating);
		document.productReviewform1.productReviewBoardRating.value=productReviewBoardRating;
	
}
// 댓글 유효성 검사
$(document).ready(function() {
    $('#productReviewInsert').submit(function() {
        if ($('#productReviewBoardContent').val() == '') {
            alert('코멘트를 입력해주세요.');
            return false;
        }
        if ($('#productReviewBoardRating').val() == ''){
        	alert('별점을 선택해주세요.');
            return false;
        }
    }); // end submit()
}); // end ready()

</script>

				
				</div>							
			</div>
			
		</div>
		
	</div>





	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>

</body>
</html>
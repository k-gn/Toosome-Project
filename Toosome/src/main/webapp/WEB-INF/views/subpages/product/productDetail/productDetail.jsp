<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  <link rel="stylesheet" href="/resources/css/subpages/product/productDetail/productDetail.css">
  <script src="/resources/js/subpages/menuDetail/menuDetail.js"></script>
  <script src="/resources/js/subpages/product/product.js"></script>
  <title>A TOOSOME PLACE</title>
</head>

<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="productDetail-container">      
      <div class="contents">
	
        <img class="product-img" src="https://toosome.s3.ap-northeast-2.amazonaws.com/${productDetail.productImageVO.productImageRoute}/${productDetail.productImageVO.productImageName}.${productDetail.productImageVO.productImageExtention}" alt="">
	
        <ul class="star cf">
          <li> <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_off.png" alt=""></li>
          <li>${productDetail.productSubName}</li>
        </ul> 
        <p class="strong">${productDetail.productTitleName}</p>
        <p class="product-pay"><span class="com">${productDetail.productPrice}</span> 원</p>
        <p class="title-text">${productDetail.productContent}<p>
        
        
        <ul class="order-btn cf">
          <li><a href="/basket?productId=${productDetail.productId}" class="online">온라인 주문</a></li>
          <li><a class="basket" onclick="AddToCart('${productDetail.productId}')">장바구니 담기</a></li>

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
                </ul>
              </li>
              <li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName2}</span>
                <ul class="one">
                  <li>${productDetail.productPrecautionsVO.productPrecautionsContent2}
                  </li>
                </ul>
              </li>
              <li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName3}</span>
                <ul class="one">
                  <li>${productDetail.productPrecautionsVO.productPrecautionsContent3}
                  </li>
                </ul>
              </li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="prev">&lt;</button>
            <button class="list">목록</button>
            <button class="next">&gt;</button>
          </div>
            
          <ul class="one-comment">
            <li class="bold">
              COMMENT 맛있는 제품 한마디
            </li>
            <li class="thin">
              ※ 게시판 성격과 맞지 않거나, 비방글은 언제든지 삭제될 수 있습니다.
            </li>
          </ul>

          <form action="#" method="post" class="form1">
            <div class="star-catch-cover">
              <div class="star-catch">
	            <p class="star_img star"><img id="starimg5" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png"></p>
		        <p class="star_img"><img id="starimg4" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png"></p>
		        <p class="star_img"><img id="starimg3" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png"></p>
		        <p class="star_img"><img id="starimg2" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png"></p>
		        <p class="star_img"><img id="starimg1" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png"></p>
              </div>
           
<!-- 
	<p class="star_img star"><img src="/resources/img/subpages/product/productDetail/ico_star_off.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_4.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_2.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></p>

                   <p id="star">
	        <p class="star_img star"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_off.png" value="0"/> 
	        <p class="star_img"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png" value="1"/>
	        <p class="star_img"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png"  value="2"/>
	        <p class="star_img"> <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png"  value="3"/> 
	        <p class="star_img"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png"  value="4"/>
	        <p class="star_img"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png" value="5"/>
	    </p>
-->
              <div class="triangle-cover">
                ▼
              </div>
              
              <ul class="star-drop">
                <li><a href="#"><img id="starimg5" onmouseover=show(5) onclick=mark(5) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png" alt=""></a></li>
                <li><a href="#"><img id="starimg4" onmouseover=show(4) onclick=mark(4) src="/resources/img/subpages/product/productDetail/ico_star_4.png" alt=""></a></li>
                <li><a href="#"><img id="starimg3" onmouseover=show(3) onclick=mark(3) src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></a></li>
                <li><a href="#"><img id="starimg2" onmouseover=show(2) onclick=mark(2) src="/resources/img/subpages/product/productDetail/ico_star_2.png" alt=""></a></li>
                <li><a href="#"><img id="starimg1" onmouseover=show(1) onclick=mark(1) src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></a></li>
              </ul>
            </div>
			
            <input type="text" placeholder="제품 한마디를 등록해 주세요.">
            <input type="hidden" name="star" />
            <c:if test="${sessionScope.memberMemberId == null }">
            <input type="submit" value="쓰기">
            </c:if>
            <c:if test="${sessionScope.memberMemberId != null }">
			<input type="submit" value="쓰기">
            </c:if>
          </form>
          
          <c:if test="${reviewBoardType != 0}">
          <form action="#" method="get" class="form2">
            <ul class="comment-end">
              <li>
               <c:forEach var="reviewBoardVO" items="${cmtList}">
               <span class="star-fin">${reviewBoardVO.reviewBoardRating }
               <c:if test="${reviewBoardVO.reviewBoardRating == 5 }">
               	<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png"/>
               	</c:if>
               	<c:if test="${reviewBoardVO.reviewBoardRating == 4 }">
               	<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png"/>
               	</c:if>
               	<c:if test="${reviewBoardVO.reviewBoardRating == 3 }">
               	<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png"/>
               	</c:if>
               	<c:if test="${reviewBoardVO.reviewBoardRating == 2 }">
               	<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png"/>
               	</c:if>
               	<c:if test="${reviewBoardVO.reviewBoardRating == 1 }">
               	<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png"/>
               	</c:if>
               </span>
               <span class="cocom">${reviewBoardVO.reviewBoardContent}</span>
               <span class="nik">${reviewBoardVO.memberName}</span>
               <span class="dat">${reviewBoardVO.reviewBoardRegDate}</span>
              </li>
            </ul>
          </form>
          </c:forEach>
          </c:if>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
<script>
const coms = document.querySelectorAll('.com');
coms.forEach((com => {
    let num = +(com.innerHTML);
    com.innerHTML = num.toLocaleString('en');
}));
</script>
<script>
getReply(); // 해당 페이지 실행 시 해당 함수 호출
var locked =0;

function show(star){
	if(locked)
		return;
	var i;
	var img;
	var el;
	for(i = 1; i>=star; i++){
		img = 'starimg'+i;
		el = document.getElementById(img);
		el.src = "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png";
	}
}
function lock(star){
	show(star);
	locked =1;
}
function mark(star){
	lock(star);
	alert(star+"개의 별점을 선택하셨습니다.");
	document.cmtform.star.value=star;
}
</script>
</body>
</html>
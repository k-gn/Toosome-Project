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
          <li><img src="/resources/img/subpages/product/productDetail/ico_star_off.png" alt=""></li>
          <li>${productDetail.productSubName}</li>
        </ul> 
        <p class="strong">${productDetail.productTitleName}</p>
        <p class="product-pay"><span class="com">${productDetail.productPrice}</span> 원</p>
        <p class="title-text">${productDetail.productContent}</p>
        
        
        <ul class="order-btn cf">
          <li><a href="#" class="online">온라인 주문</a></li>
          <%-- <input type="button" class="basket" value="장바구니 담기" onclick="AddToCart('${productDetail.productId}')"> --%>
          <li><a href="#" class="basket" onclick="AddToCart('${productDetail.productId}')">장바구니 담기</a></li>
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
                <p class="star_img star"><img src="/resources/img/subpages/product/productDetail/ico_star_off.png" alt=""><!--<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${scoreDetail.productScoreVO.scoreImageRoute}/${scoreDetail.productScoreVO.scoreImageName}.${scoreDetail.productScoreVO.scoreImageExtention}" alt="">--></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_4.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_2.png" alt=""></p>
                <p class="star_img"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></p>
              </div>

              <div class="triangle-cover">
                ▼
              </div>
              
              <ul class="star-drop">
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_5.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_4.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_2.png" alt=""></a></li>
                <li><a href="#"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></a></li>
              </ul>
            </div>

            <input type="text" placeholder="제품 한마디를 등록해 주세요.">
            <input type="submit" value="쓰기">

          </form>
          <form action="#" method="get" class="form2">
            
            <ul class="comment-end">
              <li>
                <span class="star-fin"><img src="/resources/img/subpages/product/productDetail/ico_star_1.png" alt=""></span>
                <span class="cocom">불량식품 맛 나요..ㅡㅡ</span>
                <span class="nik">admin**</span>
                <span class="dat">2021.04.02</span>
              </li>
              <li>
                <span class="star-fin"><img src="/resources/img/subpages/product/productDetail/ico_star_3.png" alt=""></span>
                <span class="cocom">달달하니 좋네용용용</span>
                <span class="nik">Tommy.Lee**</span>
                <span class="dat">2021.04.01</span>
              </li>
            </ul>
          </form>
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
}))
</script>
</body>
</html>
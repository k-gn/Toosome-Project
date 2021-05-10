<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
<link rel="stylesheet"
	href="/resources/css/subpages/menuDetail/menuDetail.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/subpages/menuDetail/menuDetail.js"></script>
<title>A TOOSOME PLACE</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- 메뉴 디테일 페이지 시작 -->
		<div class="menuDetail-container">
			<!-- 메뉴 내용들 -->
			<div class="title-container">
			<c:if test="${menubeverageDetail.menuType == 1}">
				<span class="menuDetail-title big">커피 &amp; 음료</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType != 1}">
				<span class="menuDetail-title">커피 &amp; 음료</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType == 2}">
			 	<span class="menuDetail-title big">디저트</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType != 2}">
			 	<span class="menuDetail-title">디저트</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType == 3}">
			    <span class="menuDetail-title big">델리</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType != 3}">
			    <span class="menuDetail-title">델리</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType == 4}">
			    <span class="menuDetail-title big">홀케이크</span>
			</c:if>
			<c:if test="${menubeverageDetail.menuType != 4}">
			    <span class="menuDetail-title">홀케이크</span>
			</c:if>
			</div>

			<div class="contents">
				<!-- 해당 메뉴 이미지 -->
				<img
					src="https://toosome.s3.ap-northeast-2.amazonaws.com/${menubeverageDetail.menuImageVO.menuImageRoute}/${menubeverageDetail.menuImageVO.menuImageName}.${menubeverageDetail.menuImageVO.menuImageExtention}">
				
				<ul class="star cf">
					<!-- 평균별점 -->
					<li><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/menuDetail/ico_star_${menubeverageDetail.menuStar}.png" alt=""></li>


					<!-- 메뉴 서브내용 -->

					<li>${menubeverageDetail.menuSubTitle}</li>
				</ul>
				<!-- 메뉴 이름 -->
				<h3>${menubeverageDetail.menuMainTitle}</h3>
				<!-- 메뉴 코멘트 -->
				<p class="title-text">${menubeverageDetail.menuContent}</p>
				<!-- 메뉴 가격 -->
				<div class="pay-box">
				  <span class="com" style="float: left;">${menubeverageDetail.menuPrice}</span>
				  <span style="float: left;">&nbsp;원</span>
				</div>
				<!-- 기프티콘 구매 버튼 -->
				<a href="/menuorder?menuId=${menubeverageDetail.menuId}" class="gift">기프티콘 구매</a>
				<!-- 해당메뉴 영양성분표 -->
				<div class="table-cover">
					<table class="table">
						<tbody>
							<tr class="table-active">
								<td>총 용량(ml/잔)</td>
								<td>${menubeverageDetail.iatVO.iatWeight}/${menubeverageDetail.iatVO.iatFullSupply}</td>
							</tr>
							<tr>
								<td>1회 제공량(ml/g)</td>
								<td>${menubeverageDetail.iatVO.iatOneSupply}</td>
							</tr>
							<tr>
								<td>열량(Kcal)</td>
								<td>${menubeverageDetail.iatVO.iatKcal}</td>
							</tr>
							<tr>
								<td>당류(g/%)</td>
								<td>${menubeverageDetail.iatVO.iatSugars}</td>
							</tr>
							<tr>
								<td>단백질(g/%)</td>
								<td>${menubeverageDetail.iatVO.iatProtein}</td>
							</tr>
							<tr>
								<td>포화지방(g/%)</td>
								<td>${menubeverageDetail.iatVO.iatSaturatedFat}</td>
							</tr>
							<tr>
								<td>나트륨(mg/%)</td>
								<td>${menubeverageDetail.iatVO.iatNatrium}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 메뉴 관련 공지 -->
				<ul class="notice-box">
					<li>※ 상기 이미지는 실제 제품과 다소 차이가 있을 수 있습니다. (토핑 과일은 계절에 따라 달라질 수
						있습니다.)</li>
					<li>※ 제품의 취급여부는 매장별로 상이할 수 있습니다.</li>
				</ul>
				
				<div class="comment-box">
					<!-- 목록으로 가기 버튼 -->
					<div class="btn-group">
						<button class="list" onclick="history.back()">목록</button>
					</div>
					
					<ul class="one-comment">
						<li class="bold">COMMENT 맛있는 제품 한마디</li>
						<li class="thin">※ 게시판 성격과 맞지 않거나, 비방글은 언제든지 삭제될 수 있습니다.</li>
					</ul>

					<form action="/menuReviewInsert" method="post" id="menuReviewInsert" name="menuReviewform1" class="form1">
						<div class="star-catch-cover">
							<div class="star-catch">
								<p class="star_img star">
									<img id="starimg5" onclick=mark(5) onload=mark(5) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png">
								</p>
								<p class="star_img">
									<img id="starimg4" onclick=mark(4) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png">
								</p>
								<p class="star_img">
									<img id="starimg3" onclick=mark(3) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png">
								</p>
								<p class="star_img">
									<img id="starimg2" onclick=mark(2) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png">
								</p>
								<p class="star_img">
									<img id="starimg1" onclick=mark(1) src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png">
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
										src="/resources/img/subpages/product/productDetail/ico_star_4.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg3"
										onclick=mark(3)
										src="/resources/img/subpages/product/productDetail/ico_star_3.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg2"
										onclick=mark(2)
										src="/resources/img/subpages/product/productDetail/ico_star_2.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg1"
										onclick=mark(1)
										src="/resources/img/subpages/product/productDetail/ico_star_1.png"
										alt=""></a></li>
							</ul>

							<input id="menuReviewBoardRating" type="hidden" name="menuReviewBoardRating" />

					</div>

						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input name="menuId"  type="hidden" value="${menubeverageDetail.menuId}" />
			        	<input name="memberId" type="hidden" value="${id}"/>
			        	<input name="menuReviewBoardWriter" type="hidden" value="${auth == 'ROLE_USER' ? name : '관리자'}"/>
	        			<input id="menuReviewBoardContent" type="text" name="menuReviewBoardContent" placeholder="제품 한마디를 등록해 주세요."> 
						<input	type="submit" value="쓰기">
					</div>
						

					</form>
					<ul class="comment-end">
					
					<c:forEach var="menuReviewList" items="${menuReviewList}" varStatus="status">
					<form method="get" class="form2">
				
	        			<input name="menuId"  type="hidden" value="${menubeverageDetail.menuId}" />
	        			<input name="memberId" type="hidden" value="${id}"/>
        				<input name="menuReviewBoardId"  type="hidden" value="${menuReviewList.menuReviewBoardId}" />							        	
				        <input name="menuReviewBoardWriter" type="hidden" value="${auth == 'ROLE_USER' ? name : '관리자'}"/>
		        		
		        		<li>
							<span class="star-fin"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_${menuReviewList.menuReviewBoardRating }.png" alt=""></span>
							<span class="cocom">${menuReviewList.menuReviewBoardContent}//${menuReviewList.menuReviewBoardId}</span> 
							<c:if test="${menuReviewList.memberId == sessionScope.id }">
							<span><input class="menuReviewBoardContent" type="text" name="menuReviewBoardContent" value="${menuReviewList.menuReviewBoardContent}"></span>
							</c:if>
							<span class="nik">${menuReviewList.menuReviewBoardWriter}</span>
							<span class="dat"><fmt:formatDate value="${menuReviewList.menuReviewBoardRegDate}" pattern="yyyy.MM.dd" /></span>
							
							
						</li>
						<div>
							<c:if test="${menuReviewList.memberId == sessionScope.id }">
							<span><button id="menuReviewDelBtn${status.count}" type="submit" formaction="/menuReviewDelete" >삭제</button></span>
					        <span><button id="menuReviewUpdBtn${status.count}" type="submit"  formaction="/menuReviewUpdate" >수정</button></span>
							</c:if>
						</div>
					</form>
					   </c:forEach>
						</ul>
					
		<script type="text/javascript">
var locked = 0;
function show(menuReviewBoardRating){
	if(locked)
		return;
	var i;
	var starimg;
	for(i=1; i<=menuReviewBoardRating; i++){
		starimg = 'starimg'+i;
		el = document.getElementById(starimg);	
	}
}

function lock(menuReviewBoardRating){
	show(menuReviewBoardRating);
	locked=1;
}
function mark(menuReviewBoardRating){
	lock(menuReviewBoardRating);
		document.menuReviewform1.menuReviewBoardRating.value=menuReviewBoardRating;
	
}
$(document).ready(function() {
    $('#menuReviewInsert').submit(function() {
        if ($('#menuReviewBoardContent').val() == ''){
            alert('코멘트를 입력해주세요.');
            return false;
        }
        if ($('#menuReviewBoardRating').val() == ''){
        	alert('별점을 선택해주세요.');
            return false;
        }
    }); // end submit()
}); // end ready()
</script> 
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
	</div>
</body>   		
<script>
const coms = document.querySelectorAll('.com');
coms.forEach((com => {
    let num = +(com.innerHTML);
    com.innerHTML = num.toLocaleString('en');
}))
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/subpages/nutrient/nutrient.css">
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
<!-- 영양성분표 시작 -->
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="nutrient-container">
      <div class="title-container">
          <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
          
      </div>
	  <div class="sub-header-container">
      		<h3>영양성분표</h3>
      		<!-- 영양성분표 navigation -->
      		<div class="navigation-container">
      			<ul>
      				<li><a href="/">HOME</a></li>
      				<li><a href="/menu-new">MENU</a></li>
      				<li><a href="/nutrient1">영양성분표</a></li>
      				<li><a href="/nutrient3">커피&amp;음료</a></li>
      			</ul>
      		</div>
      </div>
      <div class="contents">
      <!-- 영양성분표 퀵메뉴 -->
        <ul class="menu-tab">
          <li><a href="/nutrient1">디저트</a></li>
          <li><a href="/nutrient2">케이크</a></li>
          <li class="click"><a href="/nutrient3">커피 &amp; 음료</a></li>
          <li><a href="/nutrient4">델리</a></li>
        </ul>
        <!-- 검색기능 -->
		<form action="/nutrient3/search" method="get">
	        <div class="search">
	          <input type="search" name="keyword" value="${menuVO.keyword}" placeholder="제품명을 입력하세요.">
	          <input type="image" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/nutrient/search.gif" alt="">
	        </div>
		</form>
		<!-- 영양성분표 테이블 -->
        <table class="table table-hover">
          <thead class="thead-dark">
            <tr>
              <th>제품명</th>
              <th>총 제공량</th>
              <th>1회 제공량</th>
              <th>중량 / 용량<br/>(g) / (ml)</th>
              <th>열량<br/>(kcal)</th>
              <th>당류<br/>(g/%)</th>
              <th>단백질<br/>(g/%)</th>
              <th>포화지방<br/>(g/%)</th>
              <th>나트륨<br/>(mg/%)</th>
            </tr>
          </thead>
          <!-- 받은 데이터 내용 -->
     	  <div class="menu-content3">
			<c:forEach var="nutrient3" items="${nutrient3}">
				<tr>
					<td>${nutrient3.menuMainTitle}</td>
					<td>${nutrient3.iatVO.iatFullSupply}</td>
					<td>${nutrient3.iatVO.iatOneSupply}</td>
					<td>${nutrient3.iatVO.iatWeight}</td>
					<td>${nutrient3.iatVO.iatKcal}</td>
					<td>${nutrient3.iatVO.iatSugars}</td>
					<td>${nutrient3.iatVO.iatProtein}</td>
					<td>${nutrient3.iatVO.iatSaturatedFat}</td>
					<td>${nutrient3.iatVO.iatNatrium}</td>
				</tr>
			</c:forEach>
		  </div>
        </table>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
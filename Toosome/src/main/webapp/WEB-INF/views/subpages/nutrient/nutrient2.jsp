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
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <div class="nutrient-container">
      <div class="title-container">
          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
          <span class="nutrient-title">영양성분표</span>
      </div>

      <div class="contents">
        <ul class="menu-tab">
          <li><a href="/nutrient1">디저트</a></li>
          <li class="click"><a href="/nutrient2">케이크</a></li>
          <li><a href="/nutrient3">커피 &amp; 음료</a></li>
          <li><a href="/nutrient4">델리</a></li>
        </ul>
	
        <div class="search2">
       <form action="/nutrient2/search" method="get"> 
          <input type="search" name="keyword" value="${menuVO.keyword}" placeholder="제품명을 입력하세요.">
          <input type="image" src="/resources/img/subpages/nutrient/search.gif" alt="검색버튼">
       </form>
        </div>

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
         
         <div class="menu-content2">
						<c:forEach var="nutrient2" items="${nutrient2}">
							<li>
							<tr>
								<td>${nutrient2.menuMainTitle}</td>
								<td>${nutrient2.iatVO.iatFullSupply}</td>
								<td>${nutrient2.iatVO.iatOneSupply}</td>
								<td>${nutrient2.iatVO.iatWeight}</td>
								<td>${nutrient2.iatVO.iatKcal}</td>
								<td>${nutrient2.iatVO.iatSugars}</td>
								<td>${nutrient2.iatVO.iatProtein}</td>
								<td>${nutrient2.iatVO.iatSaturatedFat}</td>
								<td>${nutrient2.iatVO.iatNatrium}</td>
							</tr>
							</li>
						</c:forEach>
					</div>      
        </table>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
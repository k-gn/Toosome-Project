<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <li><a href="#" onclick="location.href='/nutrienta'">디저트</a></li>
          <li><a href="#" onclick="location.href='/nutrientb'">케이크</a></li>
          <li class="click"><a href="#" onclick="location.href='/nutrientc'">커피 &amp; 음료</a></li>
          <li><a href="#" onclick="location.href='/nutrientd'">델리</a></li>
        </ul>

        <div class="search">
          <input type="search" placeholder="검색어를 입력하세요.">
          <input type="image" src="/resources/img/subpages/nutrient/search.gif" alt="">
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
          <tbody>
            <tr>
              <td>베리 리치 프라페</td>
              <td>1잔</td>
              <td>414ml</td>
              <td>414</td>
              <td>210</td>
              <td>49/49</td>
              <td>1g미만/1</td>
              <td>0/0</td>
              <td>10/1</td>
            </tr>
            <tr>
              <td>베리 리치 프라페</td>
              <td>1잔</td>
              <td>414ml</td>
              <td>414</td>
              <td>210</td>
              <td>49/49</td>
              <td>1g미만/1</td>
              <td>0/0</td>
              <td>10/1</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <link rel="stylesheet" href="/resources/css/subpages/memberShip/myMembership/myMembership.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/subpages/memberShip/myMembership/myMembership.js" defer></script>
  <title>A TOOSOME PLACE</title>
  <script type="text/javascript">
  	const point = "${membership.membershipPoint}";
  </script>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
   
  <div class="myMember-container">
    <p class="title">마이 멤버십</p>
      
      <div class="top-box">
        <div class="member-tier">
          <img src="" alt="">
        </div>
        <div class="member-info">
          <div class="pro">
            <div class="progress">
              <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">75%</div>
            </div>
            <div class="pro-text">
              <ul>
                <li class="min"></li>
                <li class="max"></li>
              </ul>
            </div>
          </div>
          <p class="info-foot">현재 포인트 <span></span> P</p>
          <p class="minus">다음 등급까지 남은 포인트는 <span></span> p 남았습니다.</p>
        </div>
      </div>
      
      <div class="bottom-box">
        <p class="tier-contents">등급 별 정보</p>

        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">등급</th>
              <th scope="col">범위</th>
              <th scope="col">할인율</th>
              <th scope="col">적립율</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="lvl" items="${lvl}">
          		<tr>
	              <th scope="row"><img src="/resources/img/subpages/member/myMembership/tier/${lvl.levelImg}" alt=""></th>
	              <td>${lvl.levelName}</td>
	              <td>${lvl.levelMinRange}p ~ ${lvl.levelMaxRange == null ? '∞' : lvl.levelMaxRange}p</td>
	              <td class="discountRate">${lvl.levelDiscountRate}%</td>
	              <td class="pointRate">${lvl.levelPointRate}%</td>
	            </tr>
          	</c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>  
</body>
</html>
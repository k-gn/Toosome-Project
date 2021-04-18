<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script src="/resources/js/subpages/memberShip/myMembership/myMembership.js"></script>
  <title>A TOOSOME PLACE</title>
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
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row"><img src="/resources/img/subpages/member/myMembership/tier/bronze_1.png" alt=""></th>
              <td>브론즈</td>
              <td>0p ~ 5000p</td>
              <td>0%</td>
            </tr>
            <tr>
              <th scope="row"><img src="/resources/img/subpages/member/myMembership/tier/silver_1.png" alt=""></th>
              <td>실버</td>
              <td>5001p ~ 10000p</td>
              <td>10%</td>
            </tr>
            <tr>
              <th scope="row"><img src="/resources/img/subpages/member/myMembership/tier/gold_1.png" alt=""></th>
              <td>골드</td>
              <td>10001p ~ 15000p</td>
              <td>15%</td>
            </tr>
            <tr>
              <th scope="row"><img src="/resources/img/subpages/member/myMembership/tier/platinum_1.png" alt=""></th>
              <td>플레티넘</td>
              <td>15001p ~ 20000p</td>
              <td>20%</td>
            </tr>
            <tr>
              <th scope="row"><img src="/resources/img/subpages/member/myMembership/tier/diamond_1.png" alt=""></th>
              <td>다이아몬드</td>
              <td>20001p ~ ∞</td>
              <td>25%</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>  
</body>
</html>
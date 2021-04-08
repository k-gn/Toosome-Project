<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/menuDetail/menuDetail.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/subpages/menuDetail/menuDetail.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
      <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="menuDetail-container">
          <div class="title-container">
            <span class="menuDetail-title">NEW</span>
            <span class="menuDetail-title">커피 &amp; 음료</span>
            <span class="menuDetail-title big">디저트</span>
            <span class="menuDetail-title">델리</span>
            <span class="menuDetail-title">홀케이크</span>
          </div>
          
          <div class="contents">
            <img src="/resources/img/subpages/menuDetail/grapefruit_big_img.txt" alt="">

            <ul class="star cf">
              <li><img src="/resources/img/subpages/menuDetail/ico_star_off.png" alt=""></li>
              <li>Grapefruit Citrus Frappe</li>
            </ul>
            <h3>자몽 시트러스 프라페</h3>
            <p class="title-text">자몽의 새콤 달콤한 맛으로 지친 몸과 마음을 힐링하는 과일 프라페</p>
          
            <div class="table-cover">
              <table class="table">
                <tbody>
                  <tr class="table-active">
                    <td>총 용량</td>
                    <td>414ml (총제공량 : 1잔)</td>
                  </tr>
                  <tr>
                    <td>1회 제공량</td>
                    <td>414ml</td>
                  </tr>
                  <tr>
                    <td>열량(Kcal)</td>
                    <td>190Kcal</td>
                  </tr>
                  <tr>
                    <td>당류(g/%)</td>
                    <td>44g/44%</td>
                  </tr>
                  <tr>
                    <td>단백질(g/%)</td>
                    <td>1g/1%</td>
                  </tr>
                  <tr>
                    <td>포화지방(g/%)</td>
                    <td>0g/0%</td>
                  </tr>
                  <tr>
                    <td>나트륨(mg/%)</td>
                    <td>50mg/3%</td>
                  </tr>
                </tbody>
              </table>
            </div>

            <ul class="notice-box">
              <li>※ 상기 이미지는 실제 제품과 다소 차이가 있을 수 있습니다. (토핑 과일은 계절에 따라 달라질 수 있습니다.)</li>
              <li>※ 제품의 취급여부는 매장별로 상이할 수 있습니다.</li>
            </ul>

            <div class="comment-box">
              
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
                    <p class="star_img star"><img src="/resources/img/subpages/menuDetail/ico_star_5.png" alt=""></p>
                    <p class="star_img"><img src="/resources/img/subpages/menuDetail/ico_star_4.png" alt=""></p>
                    <p class="star_img"><img src="/resources/img/subpages/menuDetail/ico_star_3.png" alt=""></p>
                    <p class="star_img"><img src="/resources/img/subpages/menuDetail/ico_star_2.png" alt=""></p>
                    <p class="star_img"><img src="/resources/img/subpages/menuDetail/ico_star_1.png" alt=""></p>
                  </div>

                  <div class="triangle-cover">
                    ▼
                  </div>
                  
                  <ul class="star-drop">
                    <li><a href="#"><img src="/resources/img/subpages/menuDetail/ico_star_5.png" alt=""></a></li>
                    <li><a href="#"><img src="/resources/img/subpages/menuDetail/ico_star_4.png" alt=""></a></li>
                    <li><a href="#"><img src="/resources/img/subpages/menuDetail/ico_star_3.png" alt=""></a></li>
                    <li><a href="#"><img src="/resources/img/subpages/menuDetail/ico_star_2.png" alt=""></a></li>
                    <li><a href="#"><img src="/resources/img/subpages/menuDetail/ico_star_1.png" alt=""></a></li>
                  </ul>
                </div>

                <input type="text" placeholder="제품 한마디를 등록해 주세요.">
                <input type="submit" value="쓰기">

              </form>
              <form action="#" method="get" class="form2">
                
                <ul class="comment-end">
                  <li>
                    <span class="star-fin"><img src="/resources/img/subpages/menuDetail/ico_star_1.png" alt=""></span>
                    <span class="cocom">불량식품 맛 나요..ㅡㅡ</span>
                    <span class="nik">admin**</span>
                    <span class="dat">2021.04.02</span>
                  </li>
                  <li>
                    <span class="star-fin"><img src="/resources/img/subpages/menuDetail/ico_star_3.png" alt=""></span>
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
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/siteMap/siteMap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
      <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
        <!-- header-end -->

        <div class="siteMap-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="siteMap-title">SITE MAP</span>
            </div>

            <div class="contents">
                <table class="table table-bordered table-hover">
                    <thead class="color-red">
                      <tr>
                        <th>Brand Story</th>
                        <th>Menu</th>
                        <th>Store</th>
                        <th>What's News</th>
                        <th>Others</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="#">브랜드 이야기</a></td>
                        <td><a href="#">New</a></td>
                        <td><a href="#">매장안내</a></td>
                        <td><a href="#">이벤트</a></td>
                        <td><a href="#">창업정보</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">커피 이야기</a></td>
                        <td><a href="#">커피 &amp; 음료</a></td>
                        <td></td>
                        <td><a href="#">멤버쉽 &amp; 제휴카드</a></td>
                        <td><a href="#">가맹점 전용 금융 상품</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">디저트 이야기</a></td>
                        <td><a href="#">디저트</a></td>
                        <td></td>
                        <td><a href="#">공지사항</a></td>
                        <td><a href="#">창업설명회</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">브랜드 필름</a></td>
                        <td><a href="#">델리</a></td>
                        <td></td>
                        <td><a href="#">뉴스</a></td>
                        <td><a href="#">기업 및 단체구매 안내</a></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="#">홀케이크</a></td>
                        <td></td>
                        <td><a href="#">QnA</a></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="#">상품</a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="#">영양성분표</a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
                  <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                      <tr>
                        <th>마이투썸</th>
                        <th>온라인 주문</th>
                        <th>리쿠르트</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="#">개인정보관리</a></td>
                        <td><a href="#">이용안내</a></td>
                        <td><a href="#">리쿠르트안내</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">마이멤버쉽</a></td>
                        <td><a href="#">투썸바구니</a></td>
                        <td><a href="#">매장채용안내</a></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="#">주문 확인 및 취소</a></td>
                        <td><a href="#">아카데미등록안내</a></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="#">온라인 주문 정보</a></td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>     
        <!-- footer-start -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
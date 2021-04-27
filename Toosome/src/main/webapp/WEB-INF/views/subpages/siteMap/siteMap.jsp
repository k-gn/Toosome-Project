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
                <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
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
                        <td><a href="/brandstory">브랜드 이야기</a></td>
                        <td><a href="/menu-new">New</a></td>
                        <td><a href="/map">매장안내</a></td>
                        <td><a href="/event">이벤트</a></td>
                        <td><a href="/franchise">창업정보</a></td>
                      </tr>
                      <tr>
                        <td><a href="/coffeestory">커피 이야기</a></td>
                        <td><a href="/menu-beverage">커피 &amp; 음료</a></td>
                        <td></td>
                        <td><a href="/membership">멤버쉽</a></td>
                        <td><a href="/franchisepay">가맹점 전용 금융 상품</a></td>
                      </tr>
                      <tr>
                        <td><a href="/dessertstory">디저트 이야기</a></td>
                        <td><a href="/menu-dessert">디저트</a></td>
                        <td></td>
                        <td><a href="/notice">공지사항</a></td>
                        <td><a href="/explanation">창업설명회</a></td>
                      </tr>
                      <tr>
                        <td><a href="/brandfilm1">브랜드 필름</a></td>
                        <td><a href="/menu-delhi">델리</a></td>
                        <td></td>
                        <td><a href="/news">뉴스</a></td>
                        <td><a href="/allbuy">기업 및 단체구매 안내</a></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="/menu-wholecake">홀케이크</a></td>
                        <td></td>
                        <td><a href="/qna">QnA</a></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="/product-new">상품</a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><a href="/nutrient1">영양성분표</a></td>
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
                        <th>고객센터</th>
                        <th>온라인 주문</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="/mypage">개인정보관리</a></td>
                        <td><a href="/faq">FAQ</a></td>
                        <td><a href="/basket">투썸바구니</a></td>
                      </tr>
                      <tr>
                        <td><a href="/mypage/check/${id}">개인정보</a></td>
                        <td></td>
                        <td><a href="/orderreceipt">주문내역</a></td>
                      </tr>
                      <tr>
                        <td><a href="/membership/mm">마이멤버십</a></td>
                        <td></td>
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
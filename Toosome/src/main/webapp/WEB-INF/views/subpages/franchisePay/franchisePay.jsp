<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/franchisePay/franchisePay.css">
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="franchisePay-container">
            <div class="title-container">
                <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
            </div>
			<div class="sub-header-container">
       			<h3>가맹점전용 금융상품</h3>
       			<div class="navigation-container">
       				<ul>
       					<li><a href="/">HOME</a></li>
       					<li><a href="/franchisepay">OTHERS</a></li>
       					<li><a href="/franchisepay">가맹점전용 금융상품</a></li>
       				</ul>
       			</div>
        	</div>
        	<hr>
            <div class="contents">
                <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/franchisePay/pay.PNG" alt="">

                <ul class="text">
                    <li>대출한도 및 대출금리는 채무자의 신용등급에 따라 차등 적용됩니다.</li>
                    <li>대출금액에 따른 인지대등 부대비용이 발생할 수 있습니다.</li>
                    <li>대출금리 수준은 기준 금리 변동에 따라 변동할 수 있습니다.</li>
                </ul>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
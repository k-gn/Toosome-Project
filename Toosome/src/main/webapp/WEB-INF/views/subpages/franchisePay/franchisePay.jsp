<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/franchisePay/franchisePay.css">
    <link rel="stylesheet" href="./css/franchisePay.css">
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="franchisePay-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="franchisePay-title">가맹점 전용 금융상품</span>
                <hr/>
            </div>

            <div class="contents">
                <img src="/resources/img/subpages/franchisePay/pay.PNG" alt="">

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
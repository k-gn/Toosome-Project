<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/explanation/explanation.css">
    <title>A TOOSOM PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
        <div class="explanation-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="explanation-title">창업설명회</span>
            </div>

            <div class="contents">
                <h4>당신의 창업 성공 스토리 <span>투썸플레이스</span>가 함께 합니다.</h4>
                <p class="call">
                    투썸플레이스 창업설명회는 해당 날짜에 참석 예약 후 간단한 필기도구를 지참하셔서 방문하시기 바랍니다.<br/>
                    *자세한 문의는 <span>080-723-2323</span>으로 연락바랍니다.
                </p>

                <img src="/resources/img/subpages/explanation/cal.jpg" alt="" class="cancel">
            
                <div class="place-cover">
                    <h5>[정기 창업 설명회]</h5>
                    <strong class="sub-txt">▶ 서울/수도권 창업설명회</strong>
                    <ul class="place">
                        <li><strong>설명회 장소 : </strong>투썸플레이스 을지로 사옥</li>
                        <li><strong>설명회 주소 : </strong>서울 중구 마른내로 34(초동 106-9) KT&G 을지로타워 6층</li>
                        <li>
                            <strong>찾아오시는 길 : </strong>
                            지하철 : 을지로 3가역 9번출구 도보5분, 충무로역 6번출구 도보 10분<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            버스 : 충무로, 을지로 3가, 명동성당, 백병원 등 도보 5 ~ 7분 내 다수
                        </li>
                    </ul>
                    <div class="place-btn">
                        <a href="https://map.naver.com/v5/entry/place/18701944?c=14136517.8058809,4518051.2140016,16,0,0,0,dh">
                            <img src="/resources/img/subpages/explanation/btn_location.png" alt="">
                        </a>
                    </div>

                    <h5>[참석예약방법]</h5>
                    <ul class="place">
                        <li><strong>1)전화 : </strong><span style="color: #a62326;">080-723-2323</span> 으로 신청</li>
                    </ul>
                </div>
                
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
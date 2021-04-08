<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/brandFilm/brandFilm.css">
    <script src="/resources/js/subpages/brandFilm/brandFilm.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
      <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="brandfilm-container">
            <div class="title-container">
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="brandfilm-title">Brand Film</span>
            </div>

            <div class="contents-box">
                <div class="menu-btn">
                    <ul class="btn-tab">
                        <li><a href="/brandfilm1">20 Christmas</a></li>
                        <li class="select"><a href="/brandfilm2">19 Christmas</a></li>
                        <li><a href="/brandfilm3">19 TVCF</a></li>
                    </ul>
                </div>
                <div class="menu-contents">

                    <div class="menu-contents-box a2">
                        <div id="year19" class="you-box">
                            <article class="y1-1">
                                <div class="youtube" style="background-color: navy;"></div>
                                <p class="text"></p>
                            </article>
                            <article class="y1-2">
                                <div class="youtube" style="background-color: blueviolet;"></div>
                                <p class="text"></p>
                            </article>
                            <article class="y1-3">
                                <div class="youtube" style="background-color: orangered;"></div>
                                <p class="text"></p>
                            </article>
                            <article class="y1-4">
                                <div class="youtube" style="background-color: yellowgreen;"></div>
                                <p class="text"></p>
                            </article>
                            <article class="y1-5">
                                <div class="youtube" style="background-color: midnightblue;"></div>
                                <p class="text"></p>
                            </article>
                        </div>
                        <ul class="you-thumb-box cf">
                            <li class="box-select">
                                <a href="#">
                                    <img src="/resources/img/subpages/brandFilm/19-1.jpg" alt="">
                                    <span>[투썸플레이스]<br/>Winter in my Fantasy</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="/resources/img/subpages/brandFilm/19-2.jpg" alt="">
                                    <span>[투썸플레이스]<br/>Winter in my Fantasy</span>
                                </a>
                            </li>
                            <li><a href="#"><img src="/resources/img/subpages/brandFilm/19-3.jpg" alt=""></a></li>
                            <li><a href="#"><img src="/resources/img/subpages/brandFilm/19-4.jpg" alt=""></a></li>
                            <li><a href="#"><img src="/resources/img/subpages/brandFilm/19-5.jpg" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>            
        </div>
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
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
                        <li><a href="/brandfilm2">19 Christmas</a></li>
                        <li class="select"><a href="/brandfilm3">19 TVCF</a></li>
                    </ul>
                </div>
                <div class="menu-contents">
                    <div class="menu-contents-box a3">
                        <div id="year22" class="you-box">
                            <article class="y3-1">
                                <div class="youtube">
                                	<iframe width="460" height="259" src="https://www.youtube.com/embed/3-eYngzgOGg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <p class="text">
                              	 매일 다르게, 특별하게, 새롭게<br/>
                              	 오늘은 블랙그라운드
                              	 <br/><br/>
                              	 나의 오늘을 커피하다.<br/>
                              	 투썸플레이스
                                </p>
                            </article>
                            <article class="y3-2">
                                <div class="youtube">
                                	<iframe width="460" height="259" src="https://www.youtube.com/embed/e0rNfI2jnvc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <p class="text">
                               	 어떤 플렌드로 할까?
                              	 <br/><br/>
                              	 나의 오늘을 커피하다.<br/>
                              	 투썸플레이스
                                </p>
                            </article>
                            <article class="y3-3">
                                <div class="youtube">
                                	<iframe width="460" height="259" src="https://www.youtube.com/embed/HIWTbMXxfk4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <p class="text">
                             	 매일 다르게, 특별하게, 새롭게<br/>
                              	 오늘은 아로마노트
                              	 <br/><br/>
                              	 나의 오늘을 커피하다.<br/>
                              	 투썸플레이스
                                </p>
                            </article>
                            <article class="y3-4">
                                <div class="youtube">
                                	<iframe width="460" height="259" src="https://www.youtube.com/embed/tFZe9AppwZU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <p class="text">
                             	 매일 다르게, 특별하게, 새롭게<br/>
                              	 오늘은 아로마노트
                              	 <br/><br/>
                              	 나의 오늘을 커피하다.<br/>
                              	 투썸플레이스
                                </p>
                            </article>
                            <article class="y3-5">
                                <div class="youtube">
                                	<iframe width="460" height="259" src="https://www.youtube.com/embed/FbGxR8RZDtM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <p class="text">
                               	 어떤 플렌드로 할까?
                              	 <br/><br/>
                              	 나의 오늘을 커피하다.<br/>
                              	 투썸플레이스
                                </p>
                            </article>
                        </div>
                        <ul class="you-thumb-box cf">
                            <li class="box-select">
                                <a href="#">
                                    <img src="/resources/img/subpages/brandFilm/19-7.jpg" alt="">
                                    <span>나의 오늘을 커피하다 TVC<br/>- 블랙그라운드</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="/resources/img/subpages/brandFilm/19-8.jpg" alt="">
                                    <span>어떤 블렌드로 할까?<br/>- 블랙그라운드</span>
                                </a>
                            </li>
                            <li>
	                            <a href="#">
	                            	<img src="/resources/img/subpages/brandFilm/19-9.jpg" alt="">
	                            	<span>나의 오늘을 커피하다 TVC<br/>- 아로마노트</span>
	                            </a>
                            </li>
                            <li>
	                            <a href="#">
	                            	<img src="/resources/img/subpages/brandFilm/19-10.jpg" alt="">
	                            	<span>나의 오늘을 커피하다 TVC<br/>- 아로마노트(아이스)</span>
	                            </a>
                            </li>
                            <li>
	                            <a href="#">
	                            	<img src="/resources/img/subpages/brandFilm/19-11.jpg" alt="">
	                            	<span>어떤 블렌드로 할까?<br/>- 아로마노트</span>
	                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>            
        </div>
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
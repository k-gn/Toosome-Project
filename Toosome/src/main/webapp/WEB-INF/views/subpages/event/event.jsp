<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/event/event.css">
    <script src="/resources/js/subpages/event/event.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
        <section>
	      <div class="event-container">
	        <div class="title-container">
	          <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="#">
	        </div>
	        <div class="sub-header-container">
       			<h3>이벤트</h3>
       			<div class="navigation-container">
       				<ul>
       					<li><a href="/">HOME</a></li>
       					<li><a href="/event">WHAT'S NEWS</a></li>
       					<li><a href="/event">이벤트</a></li>
       				</ul>
       			</div>
        	</div>
	        <div class="tab-container">
	        	<ul class="tabs">
	        		<li data-tab-target="ing" class="active">진행중인 이벤트</li>
	        		<li data-tab-target="end">종료된 이벤트</li>
	        	</ul>
	        </div>
	        <div class="tab-content">
				<ul class="content" id="content"></ul>
				<button class="load-more"><img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/share/more_btn.png"></button>	
	        </div>
	      </div>
	    </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
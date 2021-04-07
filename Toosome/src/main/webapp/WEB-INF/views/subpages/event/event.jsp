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
	      <div class="signup-container">
	        <div class="title-container">
	          <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="#">
	          <span class="signup-title">이벤트</span>
	        </div>
	        <div class="tab-container">
	        	<ul class="tabs">
	        		<li data-tab-target="#ing" class="active">진행중인 이벤트</li>
	        		<li data-tab-target="#store">매장별 이벤트</li>
	        		<li data-tab-target="#end">종료된 이벤트</li>
	        	</ul>
	        </div>
	        <div class="tab-content">
		        <div id="ing" data-tab-content class="active">
					<ul class="ing-content"></ul>
					<button class="load-more"><img src="/resources/img/subpages/share/more_btn.png"></button>	
		        </div>
		        <div id="store" data-tab-content>
		        	<ul class="ing-content"></ul>
		        	<button class="load-more"><img src="/resources/img/subpages/share/more_btn.png"></button>		        
		        </div>
		        <div id="end" data-tab-content>
		        	<ul class="ing-content"></ul>
		        	<button class="load-more"><img src="/resources/img/subpages/share/more_btn.png"></button>	
		        </div>
	        </div>
	      </div>
	    </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
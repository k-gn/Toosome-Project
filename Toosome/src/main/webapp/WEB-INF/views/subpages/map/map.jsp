<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/subpages/map/map.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08b759e877ed36b4bafeb58f95cbe040&libraries=services"></script>
	<!-- KAKAO API -->
	<script
	    type="text/javascript"
	    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08b759e877ed36b4bafeb58f95cbe040"
	></script>
    <script src="/resources/js/subpages/map/map.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
        <section class="section">
        	<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form>
			                    <input type="text" value="투썸플레이스" id="keyword" size="15"> 
			                    <button id="search-btn">검색</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
        </section>
        <!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
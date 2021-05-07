<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/subpages/news/newsDetail/newsDetail.css">
  	<script src="/resources/js/subpages/news/newsDetail/newsDetail.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
		<!-- 뉴스 디테일 시작 -->
        <section>
        	<div class="sub-header-container">
        		<h3>뉴스</h3>
        		<!-- 뉴스 navigation -->
        		<nav class="navigation-container">
        			<ul>
        				<li><a href="#">HOME</a></li>
        				<li><a href="#">WHAT'S NEWS</a></li>
        				<li><a href="#">뉴스</a></li>
        			</ul>
        		</nav>
        	</div>
        	<!-- 디테일 내용 출력 -->
        	<table summary="NewsDetail" class="news-table">
        		<thead></thead>
        		<tbody id="newsDetail"></tbody>
        	</table>
        	<!-- 목록 버튼 -->
        	<div class="list-btn">
        		<a href="#" onclick="location.href='/news'">목록</a>
        	</div>
        	<!-- 뉴스 내용 이전 다음 버튼 -->
        	<table summary="NewsLocator" class="news-locator">
        		<tr class="prev"></tr>
        		<tr class="next"></tr>
        	</table>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
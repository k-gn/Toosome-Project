<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/subpages/news/news.css">
  	<script src="/resources/js/subpages/news/news.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
        <section>
        	<div class="sub-header-container">
        		<h3>뉴스</h3>
        		<nav class="navigation-container">
        			<ul>
        				<li><a href="#">HOME</a></li>
        				<li><a href="#">WHAT'S NEWS</a></li>
        				<li><a href="#">뉴스</a></li>
        			</ul>
        		</nav>
        	</div>
			<p>TOOSOME PLACE의 뉴스를 확인하세요</p>
        	<div class="search-container">
        		<div class="search-wrapper">
        			<input id="search-input" type="search" placeholder="검색어를 입력하세요">
        			<button id="search-btn">검색</button>
        		</div>
        	</div>
        	<table summary="news" class="news-table">
        		<caption class="news-cap">뉴스 번호,이미지,제목,날짜,조회수</caption>
        		<colgroup>
        			<col width="5%">
        			<col width="30%">
        			<col width="45%">
        			<col width="10%">
        			<col width="10%">
        		</colgroup>
        		<thead>
        			<tr>
        				<th scope="col">NO</th>
        				<th scope="col">이미지</th>
        				<th scope="col">제목</th>
        				<th scope="col">날짜</th>
        				<th scope="col">조회수</th>
        			</tr>
        		</thead>
        		<tbody id="news">
        		</tbody>
        	</table>
        	<div id="pagination"></div>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
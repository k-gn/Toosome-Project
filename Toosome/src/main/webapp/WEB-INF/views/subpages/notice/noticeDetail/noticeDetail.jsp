<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/subpages/notice/noticeDetail/noticeDetail.css">
  	<script src="/resources/js/subpages/notice/noticeDetail/noticeDetail.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
        <section>
        	<div class="sub-header-container">
        		<h3>공지사항</h3>
        		<nav class="navigation-container">
        			<ul>
        				<li><a href="#">HOME</a></li>
        				<li><a href="#">WHAT'S NEWS</a></li>
        				<li><a href="#">공지사항</a></li>
        			</ul>
        		</nav>
        	</div>
        	<table summary="NoticeDetail" class="notice-table">
        		<thead></thead>
        		<tbody id="noticeDetail"></tbody>
        	</table>
        	<div class="list-btn">
        		<a href="#" onclick="location.href='/notice'">목록</a>
        	</div>
        	<table summary="NoticeLocator" class="notice-locator">
        		<tr class="prev"></tr>
        		<tr class="next"></tr>
        	</table>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
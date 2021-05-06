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
		<!-- 공지사항 디테일 시작 -->
        <section>
        	<div class="sub-header-container">
        		<h3>공지사항</h3>
        		<nav class="navigation-container">
        		<!-- 공지사항 navigation -->
        			<ul>
        				<li><a href="#">HOME</a></li>
        				<li><a href="#">WHAT'S NEWS</a></li>
        				<li><a href="#">공지사항</a></li>
        			</ul>
        		</nav>
        	</div>
        	<!-- 공기사항 디테일 내용 출력 -->
        	<table summary="NoticeDetail" class="notice-table">
        		<colgroup>
        			<col width="80%">
        			<col width="20%">
        		</colgroup>
        		<thead></thead>
        		<tbody id="noticeDetail"></tbody>
        	</table>
        	<!-- 목록 버튼 -->
        	<div class="list-btn">
        		<a href="#" onclick="location.href='/notice'">목록</a>
        	</div>
        	<table summary="NoticeLocator" class="notice-locator">
        		<colgroup>
        			<col width="20%">
        			<col width="80%">
        		</colgroup>
        		<!-- 목록의 다음 이전 버튼 -->
        		<tbody>
	        		<tr class="prev"></tr>
	        		<tr class="next"></tr>
        		</tbody>
        	</table>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<link
     rel="stylesheet"
     href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
   />
<link rel="stylesheet" href="/resources/css/subpages/faq/faq.css">
<script src="/resources/js/subpages/faq/faq.js" defer></script>
<title>A TOOSOME PLACE</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
		<section>
			<div class="sub-header-container">
				<h3>FAQ</h3>
				<div class="navigation-container">
					<ul>
						<li><a href="/">HOME</a></li>
						<li><a href="/faq">FAQ</a></li>
					</ul>
				</div>
			</div>
			<p>TOOSOME PLACE에 대한 문의사항을 쉽고 빠르게 찾아보세요.</p>
			<div class="search-container">
				<div class="search-wrapper">
					<input id="search-input" type="search" placeholder="검색어를 입력하세요">
					<button id="search-btn">검색</button>
				</div>
			</div>
			<div class="faq-container">
				<c:forEach var="faqBoardList" items="${faqBoardList}">
					<div class="faq-wrapper">
						<div class="faq-question" onclick="accordionHandler(this);">
							<div>
								<span>Q</span> <span>${faqBoardList.faqBoardTitle}</span>
							</div>
							<button class="accordion">
								<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/down.png" alt="#">
							</button>
						</div>
						<div class="faq-answer">
							<div>
								<span>A</span> <span>${faqBoardList.faqBoardContent}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
		<!-- section end -->
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>
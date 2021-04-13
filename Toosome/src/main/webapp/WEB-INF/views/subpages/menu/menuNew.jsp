<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/subpages/menu/menu.css">
<title>A TOOSOME PLACE</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

		<div class="menu-container">
			<div class="title-container">
				<img class="title-logo"
					src="/resources/img/subpages/share/banner.png" alt=""> <span
					class="menu-title">MENU</span>
			</div>

			<div class="tab-container">
				<div class="menu-btn">
					<ul class="btn-tab">
						<li class="select"><a href="/menu-new">NEW</a></li>
						<li><a href="/menu-beverage">beverage</a></li>
						<li><a href="/menu-dessert">dessert</a></li>
						<li><a href="/menu-delhi">delhi</a></li>
						<li><a href="/menu-wholecake">whole cake</a></li>
					</ul>
				</div>
				<div class="menu-content">
					<ul id="new" class="cf">
						<h3>NEW</h3>
						<c:forEach var="menuNewList" items="${menuNewList}">
							<li>
								<a href="/menuDetail?menuId=${menuNewList.menuId}">
									<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${menuNewList.menuImageVO.menuImageRoute}/${menuNewList.menuImageVO.menuImageName}.${menuNewList.menuImageVO.menuImageExtention}" alt="">
									<span>${menuNewList.menuMainTitle}</span> 
									<div class="pay-box">
										<span class="com" style="float: left;">${menuNewList.menuPrice}</span>
										<span style="float: left;">&nbsp;원</span>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>
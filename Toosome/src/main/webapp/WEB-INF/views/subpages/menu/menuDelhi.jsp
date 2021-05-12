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
		<!-- 델리 메뉴 시작 -->
        <div class="menu-container">
            <div class="title-container">
                <img class="title-logo" src=https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png alt="">
            </div>
            <div class="sub-header-container">
       			<h3>MENU</h3>
       			<!-- 메뉴 navigation -->
       			<div class="navigation-container">
       				<ul>
       					<li><a href="/">HOME</a></li>
       					<li><a href="/menu-new">MENU</a></li>
       					<li><a href="/menu-delhi">델리</a></li>
       				</ul>
       			</div>
        	</div>
            <div class="tab-container">
            <!-- tab menu -->
                <div class="menu-btn">
                    <ul class="btn-tab">
                        <li><a href="/menu-new">NEW</a></li>
                        <li><a href="/menu-beverage">커피&음료</a></li>
                        <li><a href="/menu-dessert">디저트</a></li>
                        <li class="select"><a href="/menu-delhi">델리</a></li>
                        <li><a href="/menu-wholecake">홀케이크</a></li>
                    </ul>
                </div>
                <div class="menu-content">
                <!-- 메뉴 데이터 꺼내오기 -->
                        <h3>델리</h3>
                    <ul id="delhi" class="cf">
                        <!-- 메뉴 리스트 반복 -->
                        <c:forEach var="menuDelhiList" items="${menuDelhiList}">
							<li>
								<!-- 메뉴 아이디 -->
								<a href="/menuDetail?menuId=${menuDelhiList.menuId}">
									<!-- 해당 아이디값에 맞는 이미지 불러오기 -->
									<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${menuDelhiList.menuImageVO.menuImageRoute}/${menuDelhiList.menuImageVO.menuImageName}.${menuDelhiList.menuImageVO.menuImageExtention}" alt="">
									<!-- 그 메뉴가 신메뉴라면 -->
									<c:if test="${menuDelhiList.menuNew == 1}">
										<!-- New 딱지 붙이기 -->
										<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/product/ico_new.png" alt=""/>
									</c:if>
									<!-- 메뉴 이름 -->
									<span>${menuDelhiList.menuMainTitle}</span> 
									<!-- 메뉴 가격 -->
									<div class="pay-box">
										<span class="com" style="float: left;">${menuDelhiList.menuPrice}</span>
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
<script>
const coms = document.querySelectorAll('.com');
coms.forEach((com => {
    let num = +(com.innerHTML);
    com.innerHTML = num.toLocaleString('en');
}))
</script>
</html>
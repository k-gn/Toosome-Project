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
                <img class="title-logo" src="/resources/img/subpages/share/banner.png" alt="">
                <span class="menu-title">MENU</span>
            </div>

            <div class="tab-container">
                <div class="menu-btn">
                    <ul class="btn-tab">
                        <li><a href="/menu-new">NEW</a></li>
                        <li><a href="/menu-beverage">beverage</a></li>
                        <li><a href="/menu-dessert">dessert</a></li>
                        <li><a href="/menu-delhi">delhi</a></li>
                        <li class="select"><a href="/menu-wholecake">whole cake</a></li>
                    </ul>
                </div>
                <div class="menu-content">
                        <h3>whole cake</h3>
                    <ul id="whole-cake" class="cf">
                        <c:forEach var="menuWholecakeList" items="${menuWholecakeList}">
							<li>
								<a href="/menuDetail?menuId=${menuWholecakeList.menuId}">
									<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/${menuWholecakeList.menuImageVO.menuImageRoute}/${menuWholecakeList.menuImageVO.menuImageName}.${menuWholecakeList.menuImageVO.menuImageExtention}" alt="">
									<c:if test="${menuBeverageList.menuNew == 1}">
										<img src="/resources/img/subpages/menuDetail/ico_new.png" alt=""/>
									</c:if>
									<span>${menuWholecakeList.menuMainTitle}</span> 
									<div class="pay-box">
										<span class="com" style="float: left;">${menuWholecakeList.menuPrice}</span>
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
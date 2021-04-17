<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
  <h1 class="logo">
    <a href="/">
      A TOOSOME PLACE
    </a>
  </h1>
  <nav>
    <ul class="nav">
      <li class="menu-title">
        <a href="/brandstory">ABOUT US</a>
        <ul class="sub-con">
          <li><a href="/brandstory">브랜드이야기</a></li>
          <li><a href="/coffeestory">커피이야기</a></li>
          <li><a href="/dessertstory">디저트이야기</a></li>
          <li><a href="/brandfilm1">브랜드필름</a></li>
        </ul>
      </li>
      <li class="menu-title">
        <a href="/menu-new">MENU</a>
        <ul class="sub-con">
          <li><a href="/menu-new">NEW</a></li>
          <li><a href="/menu-beverage">커피&amp;음료</a></li>
          <li><a href="/menu-dessert">디저트</a></li>
          <li><a href="/menu-delhi">델리</a></li>
          <li><a href="/menu-wholecake">홀케이크</a></li>
          <li><a href="/product-new">상품</a></li>
          <li><a href="/nutrient1">영양성분표</a></li>
        </ul>
      </li>
      <li class="menu-title">
        <a href="/map">STORE</a>
        <ul class="sub-con">
          <li><a href="/map">매장안내</a></li>
        </ul>
      </li>
      <li class="menu-title">
        <a href="/event">WHAT'S NEWS</a>
        <ul class="sub-con">
          <li><a href="/event">이벤트</a></li>
          <li><a href="/membership">멤버쉽</a></li>
          <li><a href="/notice">공지사항</a></li>
          <li><a href="/news">뉴스</a></li>
          <li><a href="/qna">QnA</a></li>
        </ul>
      </li>
      <li class="menu-title">
        <a href="/franchise">OTHERS</a>
        <ul class="sub-con">
          <li><a href="/franchise">창업정보</a></li>
          <li><a href="/franchisepay">가맹점 전용 금융 상품</a></li>
          <li><a href="/explanation" >창업설명회</a></li>
          <li><a href="/allbuy">기업 및 단체구매 안내</a></li>
        </ul>
      </li>
    </ul>
  </nav>
  <div class="full-cover"></div>
  <ul class="log">
  	<c:if test="${id == null}">
	    <li><a href="/signin" id="login">LOGIN</a></li>
	    <li><a href="/agreement">SIGN UP</a></li>
	    <li><a href="/basket">BASKET</a></li>
	    <li><a href="/faq">FAQ</a></li>
  	</c:if>
  	<c:if test="${id != null}">
	    <li><a href="#" id="logout" onclick="document.getElementById('dologout').submit();">LOGOUT</a></li>
	    <li><a href="/mypage">MYPAGE</a></li>
	    <li><a href="/basket">BASKET</a></li>
	    <li><a href="/faq">FAQ</a></li>
  	</c:if>
  </ul>
  
  <form id="dologout" action="/dologout" method="POST">
    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
  </form>

  <div class="menu-bar">
    <span class="long-bar bar"></span>
    <span class="short-bar bar"></span>
    <span class="bar"></span>
  </div>

  <div class="mobile-nav">
    <ul class="m-nav">
      <li class="m-menu-title">
        <a href="/brandstory">ABOUT US</a>
        <ul class="m-sub-con">
          <li><a href="/brandstory">브랜드이야기</a></li>
          <li><a href="/coffeestory">커피이야기</a></li>
          <li><a href="/dessertstory">디저트이야기</a></li>
          <li><a href="/brandfilm1">브랜드필름</a></li>
        </ul>
      </li>
      <li class="m-menu-title">
        <a href="/menu">MENU</a>
        <ul class="m-sub-con">
          <li><a href="/menu-new">NEW</a></li>
          <li><a href="/menu-beverage">커피&amp;음료</a></li>
          <li><a href="/menu-dessert">디저트</a></li>
          <li><a href="/menu-delhi">델리</a></li>
          <li><a href="/menu-wholecake">홀케이크</a></li>
          <li><a href="/product">상품</a></li>
          <li><a href="/nutrienta">영양성분표</a></li>
        </ul>
      </li>
      <li class="m-menu-title">
        <a href="/map">매장안내</a>
      </li>
      <li class="m-menu-title">
        <a href="/event">WHAT'S NEWS</a>
        <ul class="m-sub-con">
          <li><a href="/event">이벤트</a></li>
          <li><a href="/membership">멤버쉽</a></li>
          <li><a href="/notice">공지사항</a></li>
          <li><a href="/news">뉴스</a></li>
          <li><a href="/qna">QnA</a></li>
        </ul>
      </li>
      <li class="m-menu-title">
        <a href="/franchise">OTHERS</a>
        <ul class="m-sub-con">
          <li><a href="/franchise">창업정보</a></li>
          <li><a href="/franchisepay">가맹점 전용 금융 상품</a></li>
          <li><a href="/explanation" >창업설명회</a></li>
          <li><a href="/allbuy">기업 및 단체구매 안내</a></li>
        </ul>
      </li>
    </ul>
    
    <ul class="m-log">
    <c:if test="${id == null}">
      <li><a href="/signin">LOGIN</a></li>
      <li><a href="/agreement">SIGN UP</a></li>
      <li><a href="#">BASKET</a></li>
      <li><a href="/faq">FAQ</a></li>
    </c:if>
    <c:if test="${id != null}">
      <li><a href="#" id="logout" onclick="document.getElementById('dologout').submit();">LOGOUT</a></li>
      <li><a href="/mypage">MYPAGE</a></li>
      <li><a href="/basket">BASKET</a></li>
      <li><a href="/faq">FAQ</a></li>
    </c:if>
    </ul>
  </div>
</header>
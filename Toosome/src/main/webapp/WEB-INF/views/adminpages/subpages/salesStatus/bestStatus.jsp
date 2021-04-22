<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/salesStatus/bestStatus.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="/resources/js/adminpages/subpages/salesStatus/bestStatus.js" defer></script>
</head>

<body>
  <div class="wrapper">
  	<!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/adminpages/share/sidebar/sidebar.jsp"></jsp:include>
    <!-- End Sidebar -->
    <div class="main-panel">
      <!-- Navbar -->
      <jsp:include page="/WEB-INF/views/adminpages/share/nav/nav.jsp"></jsp:include>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-warning flex">
                  <h4 class=card-title>베스트 현황</h4>
                  <div class="list-btn-box">
                    <button id="search-reset"><i class="material-icons">restart_alt</i>초기화</button>
                    <button id="search-submit"><i class="material-icons">search</i>검색</button>  
                  </div>                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                     <table class="table">
                     	<colgroup>
                     		<col width="15%">
                     		<col width="85%">
                     	</colgroup>
                       <tbody>
                         <tr>
                           <td>
                             <span><strong>분류</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="searchType" class="search-select" id="searchType">
                                <option value="menu">메뉴</option>
                                <option value="product">상품</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>기간</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="bestDate" class="search-select" id="bestDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="best-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="bestDatePeriod" class="date-picker">
                             	<button class="period best" value="0d">오늘</button>
                             	<button class="period best" value="1M">1개월</button>
                             	<button class="period best" value="3M">3개월</button>
                             	<button class="period best" value="6M">6개월</button>
                             	<button class="period best" value="1y">1년</button>
                             	<div class="calendar-wrapper">
	                              	<input id="calendar1" class="calendar" type="date" value="">
	                              	<span>&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;</span>
	                             	<input id="calendar2" class="calendar" type="date" value="">
                             	</div>
                             </div>
                           </td>
                         </tr>
                       </tbody>
                     </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-warning flex">
                  <h4 class="card-title">메뉴 베스트 현황</h4>
                  <div class="list-btn-box">
                    <button onclick="excelDownload('menu-table', '메뉴_베스트_리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
                    <div class="select-box">
	                    <select id="menu-select" class="view-select">
	                      <option value="30">30개씩 보기</option>
	                      <option value="50">50개씩 보기</option>
	                      <option value="100">100개씩 보기</option>
	                      <option value="200">200개씩 보기</option>
	                    </select>
	                    <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table id="menu-table" class="table">
                      <thead class="text-warning" id="menu-table-thead">
                        <th>
                          랭킹
                        </th>
                        <th>
                          카테고리
                        </th>
                        <th>
                          메뉴이름
                        </th>
                        <th>
                          메뉴가격
                        </th>
                        <th>
                          판매수량
                        </th>
                        <th>
                          판매금액
                        </th>
                        <th>
                          판매시작일
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="bestMenuStatus" items="${bestMenuStatus}">
	                        <tr>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuRank}
	                          </td>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuType}
	                          </td>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuMainTitle}
	                          </td>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuPrice}
	                          </td>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuSalesQuantity}
	                          </td>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuSalesAmount}
	                          </td>
	                          <td>
	                            ${bestMenuStatus.menuBestVO.menuStartDay}
	                          </td>
	                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              </div>
            </div>
          </div>
          <div class="container-fluid">
	          <div class="row">
	            <div class="col-md-12">
	              <div class="card">
	                <div class="card-header card-header-warning flex">
	                  <h4 class="card-title">상품 베스트 현황</h4>
	                  <div class="list-btn-box">
	                    <button onclick="excelDownload('product-table', '상품_베스트_리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
	                    <div class="select-box">
		                    <select id="product-select" class="view-select">
		                      <option value="30">30개씩 보기</option>
		                      <option value="50">50개씩 보기</option>
		                      <option value="100">100개씩 보기</option>
		                      <option value="200">200개씩 보기</option>
		                    </select>
		                    <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
	                    </div>
	                  </div>
	                </div>
	                <div class="card-body">
	                  <div class="table-responsive">
	                    <table id="product-table" class="table">
	                      <thead class="text-warning" id="product-table-thead">
	                        <th>
	                          랭킹
	                        </th>
	                        <th>
	                          카테고리
	                        </th>
	                        <th>
	                          상품이름
	                        </th>
	                        <th>
	                          상품가격
	                        </th>
	                        <th>
	                          판매수량
	                        </th>
	                        <th>
	                          판매금액
	                        </th>
	                        <th>
	                          판매시작일
	                        </th>
	                      </thead>
	                      <tbody>
	                     	 <c:forEach var="bestProductStatus" items="${bestProductStatus}">
		                        <tr>
		                          <td>
		                            ${bestProductStatus.productBestVO.productRank}
		                          </td>
		                          <td>
		                            ${bestProductStatus.productBestVO.productType}
		                          </td>
		                          <td>
		                            ${bestProductStatus.productBestVO.productTitleName}
		                          </td>
		                          <td>
		                            ${bestProductStatus.productBestVO.productPrice}
		                          </td>
		                          <td>
		                            ${bestProductStatus.productBestVO.productSalesQuantity}
		                          </td>
		                          <td>
		                            ${bestProductStatus.productBestVO.productSalesAmount}
		                          </td>
		                          <td>
		                            ${bestProductStatus.productBestVO.productStartDay}
		                          </td>
		                        </tr>
	                        </c:forEach>
	                      </tbody>
	                    </table>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
        	</div>
        </div>
      </div>
      <!-- Footer -->
      <jsp:include page="/WEB-INF/views/adminpages/share/footer/footer.jsp"></jsp:include>
      <!-- End Footer -->
    </div>
  </div>
</body>
</html>
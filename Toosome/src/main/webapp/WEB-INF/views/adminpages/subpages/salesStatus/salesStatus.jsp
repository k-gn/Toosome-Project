<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/salesStatus/salesStatus.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
  <script src="/resources/js/adminpages/subpages/salesStatus/salesStatus.js" defer></script>
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
                  <h4 class=card-title>매출 현황</h4>
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
                             <span><strong>결제수단 구분</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="searchType" class="search-select" id="searchType">
                                <option value="notUse">선택 안함</option>
                                <option value="p-id">무통장입금</option>
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
                              <select name="salesDate" class="search-select" id="salesDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="sales-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="salesDatePeriod" class="date-picker">
                             	<button class="period sales" value="0d">오늘</button>
                             	<button class="period sales" value="1M">1개월</button>
                             	<button class="period sales" value="3M">3개월</button>
                             	<button class="period sales" value="6M">6개월</button>
                             	<button class="period sales" value="1y">1년</button>
                             	<div class="calendar-wrapper">
	                              	<div class="col-md-3">
	                              		<div class="form-group">
	                              			<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
	                              				<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" id="calendar1">
	                              				<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
	                              					<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                              				</div>
	                              			</div>
	                              		</div>
	                              	</div>
	                              	<span>&nbsp;~&nbsp;</span>
	                              	<div class="col-md-3">
	                              		<div class="form-group">
	                              			<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
	                              				<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" id="calendar2">
	                              				<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
	                              					<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                              				</div>
	                              			</div>
	                              		</div>
	                              	</div>
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
                <div class="card-header card-header-warning">
                  <h4 class="card-title" id="search-result">기간별 판매현황</h4>
                  <span id="search-startDate" class="card-title">2021-04-19</span>~
                  <span id="search-endDate" class="card-title">2021-04-19</span>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class="text-warning" id="list-table-thead">
                        <th>
                          판매금액(A)
                        </th>
                        <th>
                          할인금액(B)
                        </th>
                        <th>
                          포인트사용(C)
                        </th>
                        <th>
                          배송비(D)
                        </th>
                        <th>
                          총 결제금액(E=A-B-C+D)
                        </th>
                        <th>
                          환불금액(F)
                        </th>
                        <th>
                          총 매출금액(G=E-F)
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="salesPeriodStatus" items="${salesPeriodStatus}">
	                        <tr>
	                          <td>
	                            ${salesPeriodStatus.productPrice}
	                          </td>
	                          <td>
	                            ${salesPeriodStatus.orderDiscount}
	                          </td>
	                          <td>
	                            ${salesPeriodStatus.orderPoint}
	                          </td>
	                          <td>
	                            ${salesPeriodStatus.orderDeliveryPrice}
	                          </td>
	                          <td>
	                            ${salesPeriodStatus.orderPrice}
	                          </td>
	                          <td>
	                            ${salesPeriodStatus.refundPrice}
	                          </td>
	                          <td>
	                            ${salesPeriodStatus.totalPrice}
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
	                  <h4 class="card-title" id="search-result">일자별 판매현황</h4>
	                  <div class="list-btn-box">
	                    <button id="excel-down" onclick="excelDownload('member-table', '판매리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
	                    <div class="select-box">
		                    <select id="memberList-select">
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
	                    <table id="member-table" class="table">
	                      <thead class="text-warning" id="list-table-thead">
	                        <th>
	                          일자
	                        </th>
	                        <th>
	                          결제수단
	                        </th>
	                        <th>
	                          판매금액
	                        </th>
	                        <th>
	                          할인액
	                        </th>
	                        <th>
	                          포인트사용
	                        </th>
	                        <th>
	                          배송비
	                        </th>
	                        <th>
	                          총 결제금액
	                        </th>
	                      </thead>
	                      <tbody>
	                     	 <c:forEach var="salesDailyStatus" items="${salesDailyStatus}">
		                        <tr>
		                          <td>
		                            ${salesDailyStatus.orderDate}
		                          </td>
		                          <td>
		                            ${salesDailyStatus.orderMethod}
		                          </td>
		                          <td>
		                            ${salesDailyStatus.orderPrice}
		                          </td>
		                          <td>
		                            ${salesDailyStatus.orderDiscount}
		                          </td>
		                          <td>
		                            ${salesDailyStatus.orderPoint}
		                          </td>
		                          <td>
		                            ${salesDailyStatus.orderDeliveryPrice}
		                          </td>
		                          <td>
		                            ${salesDailyStatus.paymentPrice}
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
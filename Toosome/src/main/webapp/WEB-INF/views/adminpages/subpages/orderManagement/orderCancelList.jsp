<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
  <link href="/resources/css/adminpages/subpages/orderManagement/orderCancelList.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  <script src="/resources/js/adminpages/subpages/orderManagement/orderCancelList.js" defer></script>
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
                <div class="card-header card-header-danger">
                  <h4 class=card-title>주문취소 리스트</h4>
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
                             <span><strong>검색어</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="searchType" class="search-select" id="searchType">
                                <option value="o-id">주문번호</option>
                                <option value="o-name">주문자명</option>
                                <option value="o-phone">주문자연락처</option>
                                <option value="r-name">수령자명</option>
                                <option value="r-phone">수령자연락처</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <input type="text" id="search-text" name="keyword" placeholder="검색어 입력">
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>주문기간</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="orderDate" class="search-select" id="orderDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="order-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="orderDatePeriod" class="date-picker">
                             	<button class="period order" value="0d">오늘</button>
                             	<button class="period order" value="1M">1개월</button>
                             	<button class="period order" value="3M">3개월</button>
                             	<button class="period order" value="6M">6개월</button>
                             	<button class="period order" value="1y">1년</button>
                             	<div class="calendar-wrapper">
	                              	<input id="calendar1" class="calendar" type="date" value="">
	                              	<span>&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;</span>
	                             	<input id="calendar2" class="calendar" type="date" value="">
                             	</div>
                             </div>
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>주문취소기간</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="orderCancelDate" class="search-select" id="orderCancelDate" onchange="changeCancelHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="Cancel-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="orderCancelDatePeriod" class="date-picker">
                             	<button class="period orderCancel" value="0d">오늘</button>
                             	<button class="period orderCancel" value="1M">1개월</button>
                             	<button class="period orderCancel" value="3M">3개월</button>
                             	<button class="period orderCancel" value="6M">6개월</button>
                             	<button class="period orderCancel" value="1y">1년</button>
                             	<div class="calendar-wrapper">
	                              	<input id="calendar3" class="calendar" type="date" value="">
	                              	<span>&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;</span>
	                             	<input id="calendar4" class="calendar" type="date" value="">
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
            <div id="profile-modal" class="modal">
	            <div class="profile-container">
		            <div class="col-md-8">
		              <div class="card">
		                <div class="card-header card-header-danger">
		                  <h4 class="card-title">주문정보 상세</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form>
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문번호</label>
		                          <input type="text" name="ordersId" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문자명</label>
		                          <input type="text" name="memberName" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문자연락처</label>
		                          <input type="text" name="memberPhone" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문상태</label>
		                          <select class="custom-select" id="modal-state" name="ordersState" disabled>
				                  	<option value="결제완료">결제완료</option>
				                  	<option value="접수완료">접수완료</option>
				                  	<option value="배송준비중">배송준비중</option>
				                  	<option value="배송중">배송중</option>
				                  	<option value="배송완료">배송완료</option>
				                  	<option value="결제취소">결제취소</option>
				                  </select>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품가격①</label>
		                          <input type="text" name="ordersProductPay" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문수량</label>
		                          <input type="text" name="ordersAmount" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">수령자명</label>
		                          <input type="text" name="ordersReceiver" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">수령자연락처</label>
		                          <input type="text" name="ordersPhone" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">우편번호</label>
		                          <input type="text" name="ordersPostcode" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주소</label>
		                          <input type="text" name="ordersAddress" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송비②</label>
		                          <input type="text" name="ordersDelivery" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">할인 금액③</label>
		                          <input type="text" name="ordersSal" class="form-control" disabled>
		                        </div>
		                      </div>
 		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">사용한 포인트④</label>
		                          <input type="text" name="ordersUsePoint" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">실결제금액(①+②-③-④)</label>
		                          <input type="text" name="ordersPayment" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">결제일자(주문)</label>
		                          <input type="date" name="ordersOrderDate" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">결제취소일자(주문)</label>
		                          <input type="date" name=ordersCancelDate class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <table class="table none">
					        	<tbody class="under-table">
					        	</tbody>
					        </table>
		                    <button id="modal-cancel" class="btn btn-danger pull-right btn-r">취소</button>
		                    <div class="clearfix"></div>
		                    <input type="hidden" name="ordersId">
		                  </form>
		                </div>
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
                <div class="card-header card-header-danger">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '주문통합리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
                    <div class="select-box">
	                    <select id="memberList-select">
	                      <option value="10000">전체보기</option>
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
                      <thead class="text-danger text-center">
                        <th>
                          주문번호
                        </th>
                        <th>
                          주문상태
                        </th>
                        <th>
                          주문자ID
                        </th>
                        <th>
                          주문자명
                        </th>
                        <th>
                          상품명
                        </th>
                        <th>
                          상품수량
                        </th>
                        <th>
                          결제금액
                        </th>
						<th>
           				  구매일
                        </th>
                        <th>
           				  구매취소일
                        </th>
                      </thead>
                      <tbody>
                     	 <tbody id="list-table-tbody" class="text-center">
                      </tbody>
                      </tbody>
                    </table>
                    <div id="pagination"></div>
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
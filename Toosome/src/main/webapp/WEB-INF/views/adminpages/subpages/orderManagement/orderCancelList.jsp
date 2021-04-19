<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/orderManagement/orderCancelList.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
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
                                <option value="p-id">상품번호</option>
                                <option value="p-name">상품명</option>
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
                             <span><strong>기간</strong></span>
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
		                      <div class="col-md-1">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문번호</label>
		                          <input type="text" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">결제수단</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문자명</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문자연락처</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문상태</label>
		                          <input type="tel" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">클레임상태</label>
		                          <input type="tel" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-1">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-5">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품명</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품가격</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품수량</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">교환신청</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품할인가</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">포인트사용</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">판매가(할인,포인트적용)</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문금액 ①</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">수령자명</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">수령자연락처</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">우편번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주소</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-1">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">택배사</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">송장번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">기본배송비</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송비합계 ②</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">실결제금액(① + ②)</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주문일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">결제일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품준비처리일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송준비처리일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송중처리일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송완료처리일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">구매확정일자</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-10">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">비고</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <button type="submit" class="btn btn-danger pull-right">업데이트</button>
		                    <button id="modal-cancel" class="btn btn-danger pull-right btn-r">취소</button>
		                    <div class="clearfix"></div>
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
                      <thead class="text-danger" id="list-table-thead">
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
                          상품가격
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="orderCancelList" items="${orderCancelList}">
	                        <tr>
	                          <td>
	                            ${orderCancelList.orderId}
	                          </td>
	                          <td>
	                            ${orderCancelList.orderState}
	                          </td>
	                          <td>
	                            ${orderCancelList.ordererId}
	                          </td>
	                          <td>
	                            ${orderCancelList.ordererName}
	                          </td>
	                          <td>
	                            ${orderCancelList.productVO.productName}
	                          </td>
	                          <td>
	                            ${orderCancelList.productVO.productCheckCount}
	                          </td>
	                          <td>
	                            ${orderCancelList.productVO.productPrice}
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
      <!-- Footer -->
      <jsp:include page="/WEB-INF/views/adminpages/share/footer/footer.jsp"></jsp:include>
      <!-- End Footer -->
    </div>
  </div>
</body>
</html>
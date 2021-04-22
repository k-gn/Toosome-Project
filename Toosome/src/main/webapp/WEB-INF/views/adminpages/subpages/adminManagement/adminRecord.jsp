<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/adminManagement/adminRecord.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="/resources/js/adminpages/subpages/adminManagement/adminRecord.js" defer></script>
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
                <div class="card-header card-header-rose">
                  <h4 class=card-title>운영자 접속기록 조회</h4>
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
                                <option value="id">ID(E-mail)</option>
                                <option value="name">이름</option>
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
                              <select name="recordDate" class="search-select" id="recordDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="record-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="recordDatePeriod" class="date-picker">
                             	<button class="period record" value="0d">오늘</button>
                             	<button class="period record" value="1M">1개월</button>
                             	<button class="period record" value="3M">3개월</button>
                             	<button class="period record" value="6M">6개월</button>
                             	<button class="period record" value="1y">1년</button>
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
                <div class="card-header card-header-rose">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '운영자_접속기록_리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
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
                      <thead class="text-rose" id="list-table-thead">
                        <th>
                          운영자명
                        </th>
                        <th>
                          ID(E-mail)
                        </th>
                        <th>
                          접속일자
                        </th>
                        <th>
                          메뉴
                        </th>
                        <th>
                          접속페이지
                        </th>
                        <th>
                          접속IP
                        </th>
                        <th>
                          수행업무
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="connectionRecord" items="${connectionRecord}">
	                        <tr>
	                          <td>
	                            ${connectionRecord.memberName}
	                          </td>
	                          <td>
	                            ${connectionRecord.memberEmail}
	                          </td>
	                          <td>
	                            ${connectionRecord.connectDate}
	                          </td>
	                          <td>
	                            ${connectionRecord.connectMenu}
	                          </td>
	                          <td>
	                            ${connectionRecord.connectPage}
	                          </td>
	                          <td>
	                            ${connectionRecord.connectIP}
	                          </td>
	                          <td>
	                            ${connectionRecord.connectWork}
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
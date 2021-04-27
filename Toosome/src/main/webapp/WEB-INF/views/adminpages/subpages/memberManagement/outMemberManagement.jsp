<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/memberManagement/outMemberManagement.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="/resources/js/adminpages/subpages/memberManagement/outMemberManagement.js" defer></script>
  <script type="text/javascript">
    const msg = "${msg}";
	if(msg === "modSuccess") {
		alert("회원정보 수정 완료");
	}
  </script>
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
                <div class="card-header card-header-primary">
                  <h4 class=card-title>탈퇴회원 리스트</h4>
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
                              <select name="condition" class="search-select" id="searchType">
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
                             <span><strong>탈퇴전환일자</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="outDate" class="search-select" id="outDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="out-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="outDatePeriod" class="date-picker">
                             	<button class="period out" value="0d">오늘</button>
                             	<button class="period out" value="1M">1개월</button>
                             	<button class="period out" value="3M">3개월</button>
                             	<button class="period out" value="6M">6개월</button>
                             	<button class="period out" value="1y">1년</button>
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
            <div id="profile-modal" class="modal">
	            <div class="profile-container">
		            <div class="col-md-8">
		              <div class="card">
		                <div class="card-header card-header-primary">
		                  <h4 class="card-title">탈퇴회원 정보수정</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form action="/admin/delOutMember" method="post">
		                    <div class="row">
		                      <div class="col-md-5">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">ID (이메일)</label>
		                          <input type="email" name="withdrawEmail" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">이름</label>
		                          <input type="text" name="withdrawName" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">전화번호</label>
		                          <input type="tel" name="withdrawPhone" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">회원가입일</label>
		                          <input type="date" name="regDate" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">회원탈퇴일</label>
		                          <input type="date" name="withdrawDate" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">주소</label>
		                          <input type="text" name="withdrawAddress" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">우편번호</label>
		                          <input type="text" name="withdrawPostcode" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">생년월일</label>
		                          <input type="text" name="withdrawBirth" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">가입유형</label>
		                          <input type="text" name="platFormType" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <button id="modal-delete" type="submit" class="btn btn-primary pull-right">삭제</button>
		                    <button id="modal-cancel" class="btn btn-primary pull-right btn-r">취소</button>
		                    <div class="clearfix"></div>
		                    <input type="hidden" name="email">
		                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
                <div class="card-header card-header-primary">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '탈퇴회원리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
                    <div class="select-box">
	                    <select id="memberList-select">
	                      <option value="10">기본</option>
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
                      <thead class="text-primary" id="list-table-thead">
                        <th>
                          회원번호
                        </th>
                        <th>
                          가입유형
                        </th>
                        <th>
                          ID(E-mail)
                        </th>
                        <th>
                          이름
                        </th>
                        <th>
                          핸드폰 번호
                        </th>
                        <th>
                          회원가입일
                        </th>
                        <th>
                          회원탈퇴일
                        </th>
                      </thead>
                      <tbody id="list-table-tbody">
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
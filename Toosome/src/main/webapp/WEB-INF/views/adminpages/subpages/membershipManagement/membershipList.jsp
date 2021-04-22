<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/membershipManagement/membershipList.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="/resources/js/adminpages/subpages/membershipManagement/membershipList.js" defer></script>
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
                <div class="card-header card-header-info">
                  <h4 class=card-title>멤버십 리스트</h4>
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
                             <span><strong>멤버십등급</strong></span>
                           </td>
                           <td>
                        	  <div class="select-box">
                              <select name="membershipGrade" class="search-select" id="membershipGrade">
                                <option value="gradeAll">전체조회</option>
                                <option value="bronze">브론즈</option>
                                <option value="silver">실버</option>
                                <option value="gold">골드</option>
                                <option value="platinum">플래티넘</option>
                                <option value="diamond">다이아몬드</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>멤버십 전환일자</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="membershipDate" class="search-select" id="membershipDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="membership-use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="membershipDatePeriod" class="date-picker">
                             	<button class="period membership" value="0d">오늘</button>
                             	<button class="period membership" value="1M">1개월</button>
                             	<button class="period membership" value="3M">3개월</button>
                             	<button class="period membership" value="6M">6개월</button>
                             	<button class="period membership" value="1y">1년</button>
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
		                <div class="card-header card-header-info">
		                  <h4 class="card-title">멤버십 정보수정</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form>
		                    <div class="row">
		                      <div class="col-md-5">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">ID (이메일)</label>
		                          <input type="email" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">이름</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">전화번호</label>
		                          <input type="tel" class="form-control">
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
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">우편번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">생년월일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">가입유형</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">멤버십등급</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                     <div class="row">
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">회원번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">회원가입일</label>
		                          <input type="date" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">멤버십번호</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">멤버십전환일</label>
		                          <input type="date" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">비고</label>
		                            <textarea class="form-control" rows="5"></textarea>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <button type="submit" class="btn btn-primary pull-right">업데이트</button>
		                    <button id="modal-cancel" class="btn btn-primary pull-right btn-r">취소</button>
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
                <div class="card-header card-header-info">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '멤버십회원리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
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
                      <thead class="text-info" id="list-table-thead">
                        <th>
                          멤버십번호
                        </th>
                        <th>
                          멤버십등급
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
                          멤버십전환일
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="membershipList" items="${membershipList}">
	                        <tr>
	                          <td>
	                            ${membershipList.memberId}
	                          </td>
	                          <td>
	                            ${membershipList.platFormType}
	                          </td>
	                          <td>
	                            ${membershipList.memberEmail}
	                          </td>
	                          <td>
	                            ${membershipList.memberName}
	                          </td>
	                          <td>
	                            ${membershipList.memberPhone}
	                          </td>
	                          <td>
	                            ${membershipList.regDate}
	                          </td>
	                          <td>
	                            ${membershipList.changeMembershipDate}
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
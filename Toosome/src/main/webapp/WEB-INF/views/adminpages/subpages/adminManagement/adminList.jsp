<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/adminManagement/adminList.css" rel="stylesheet" />
  <script src="/resources/js/adminpages/subpages/adminManagement/adminList.js" defer></script>
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
                  <h4 class=card-title>운영자 리스트</h4>
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
		                <div class="card-header card-header-rose">
		                  <h4 class="card-title">프로필 수정</h4>
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
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입사일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">최종로그인일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">생년월일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">권한이름</label>
		                          <input type="text" class="form-control">
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
		                    <button type="submit" class="btn btn-rose pull-right">업데이트</button>
		                    <button id="modal-cancel" class="btn btn-rose pull-right btn-r">취소</button>
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
                <div class="card-header card-header-rose">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '운영자리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
                    <button onclick="window.open('/admin/new','_blank','directories=no,toolbar=no,scrollbars=no,resizable=no,top=200,left=500,width=600,height=400');"><i class="material-icons">manage_accounts</i>운영자 등록</button>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table id="member-table" class="table">
                      <thead class="text-rose" id="list-table-thead">
                        <th>
                          회원번호
                        </th>
                        <th>
                          권한이름
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
                          입사일
                        </th>
                        <th>
                          최종로그인
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="adminList" items="${adminList}">
	                        <tr>
	                          <td>
	                            ${adminList.memberId}
	                          </td>
	                          <td>
	                            ${adminList.memberAuth}
	                          </td>
	                          <td>
	                            ${adminList.memberEmail}
	                          </td>
	                          <td>
	                            ${adminList.memberName}
	                          </td>
	                          <td>
	                            ${adminList.memberPhone}
	                          </td>
	                          <td>
	                            ${adminList.regDate}
	                          </td>
	                          <td>
	                            ${adminList.lastLoginDate}
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
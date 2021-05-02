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
  <link href="/resources/css/adminpages/subpages/adminManagement/adminList.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  <script src="/resources/js/adminpages/subpages/adminManagement/adminList.js" defer></script>
  <script type="text/javascript">
  	const msg = "${msg}";
  	if(msg === "success") {
  		alert("관리자 등록 성공!");
  		opener.parent.location.reload();
  		window.close();
  	}else if(msg === "dupEmail") {
  		alert("이미 존재하는 이메일 입니다.")
  		opener.parent.location.reload();
  		window.close();
  	}else if(msg === "fail") {
  		alert("입력하신 정보가 올바르지 않습니다.");
  		window.close();
  	}else if(msg === "modSuccess") {
  		alert("관리자 정보 수정 완료.");
  	}else if(msg === "modFail") {
  		alert("관리자 정보 수정 실패.");
  	}else if(msg === "delSuccess") {
  		alert("관리자 정보 삭제 완료.");
  	}else if(msg === "delFail") {
  		alert("관리자 정보 삭제 실패.");
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
		                  <h4 class="card-title">관리자 수정/삭제</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form id="formObj" action="/admin/mod" method="post">
		                    <div class="row">
		                      <div class="col-md-1">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">번호</label>
		                          <input name="memberId" type="text" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">ID (이메일)</label>
		                          <input name="email" type="email" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">이름</label>
		                          <input name="memberName" type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">전화번호</label>
		                          <input name="memberPhone" type="tel" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입사일</label>
		                          <input name="regDate" type="date" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">최종로그인일</label>
		                          <input name="lastLoginDate" type="date" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">권한설정</label>
		                          <select name="memberAuth" class="custom-select" id="memberAuth">
				                  	<option value="ROLE_HEAD">ROLE_HEAD</option>
				                  	<option value="ROLE_ADMIN">ROLE_ADMIN</option>
				                  </select>
		                        </div>
		                      </div>
		                    </div>
		                    <input type="submit" class="btn btn-rose pull-right" value="업데이트"/>
		                    <input type="button" class="btn btn-rose pull-right btn-r" value="삭제" onclick="delBtnFunc()"/>
		                    <input type="button" id="modal-cancel" class="btn btn-rose pull-right btn-r" value="취소"/>
		                    <div class="clearfix"></div>
		                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                    <input type="hidden" name="memberEmail">
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
                      <colgroup>
                      	<col width="10%">
                      	<col width="15%">
                      	<col width="30%">
                      	<col width="15%">
                      	<col width="15%">
                      	<col width="15%">
                      </colgroup>
                      <thead class="text-rose text-center" id="list-table-thead">
                        <th>
                          관리자번호
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
                          입사일
                        </th>
                        <th>
                          최종로그인
                        </th>
                      </thead>
                      <tbody id="list-table-tbody" class="text-center">
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
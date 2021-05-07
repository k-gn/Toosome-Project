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
  <link href="/resources/css/adminpages/subpages/boardManagement/noticeBoardManagement.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="/resources/js/adminpages/subpages/boardManagement/noticeBoardManagement.js" defer></script>
  <script type="text/javascript">
 	const msg = "${msg}";
 	if(msg === "successBoard") {
 		alert("정상 등록되었습니다");
 	}else if(msg === "failBoard") {
 		alert("입력하신 정보가 올바르지 않습니다.");
 	}else if(msg === 'updateSuccess') {
 		alert("수정 완료");
 	}else if(msg === 'updateFail') {
 		alert("수정 실패");
 	}else if(msg === 'deleteSuccess') {
 		alert("삭제 완료");
 	}else if(msg === 'deleteFail') {
 		alert("삭제 실패");
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
                  <h4 class=card-title>공지사항 게시판 관리</h4>
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
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <input type="text" id="search-text" name="keyword" placeholder="검색어 입력">
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>작성일</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="noticeDate" class="search-select" id="noticeDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="noticeDatePeriod" class="date-picker">
                             	<button class="period notice" value="0d">오늘</button>
                             	<button class="period notice" value="1M">1개월</button>
                             	<button class="period notice" value="3M">3개월</button>
                             	<button class="period notice" value="6M">6개월</button>
                             	<button class="period notice" value="1y">1년</button>
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
            <div id="board-modal" class="modal">
	            <div class="profile-container">
		            <div class="col-md-8">
		              <div class="card">
		                <div class="card-header card-header-primary">
		                  <h4 class="card-title">공지사항 게시글 상세</h4>
		                </div>
		                <div class="card-body">
		                  <form id="update-form" action="/admin/noticeboard-update?${_csrf.parameterName}=${_csrf.token}" method="post">
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">글번호</label>
		                          <input type="text" name="noticeBoardId" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">조회수</label>
		                          <input type="text" name="noticeBoardViewCount" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">작성일</label>
		                          <input type="date" name="noticeBoardRegdate" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">제목</label>
		                          <input id="detail-title" type="text" name="noticeBoardTitle" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">내용</label>
		                            <input id="detail-content" type="text" class="form-control" name="noticeBoardContent" />
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <input id="update-submit" type="submit" class="btn btn-primary pull-right" value="업데이트" />
		                    <input type="button" class="btn btn-primary pull-right btn-r" onclick="delBtnFunc();" value="삭제" />
		                    <input type="button" id="modal-cancel" class="btn btn-primary pull-right btn-r" value="취소" />
		                    <div class="clearfix"></div>
		                    <input type="hidden" name="noticeBoardId" />
		                  </form>
		                </div>
		             </div>
		          </div>
		       </div>
		    </div>
            <div class="modal fade" id="signupModal" tabindex="-1" role="dialog">
			  <div class="modal-dialog modal-signup" role="document">
			    <div class="modal-content">
			      <div class="card card-signup card-plain">
			        <div class="modal-header">
			          <h5 class="modal-title card-title">글등록</h5>
			          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <i class="material-icons">clear</i>
			          </button>
			        </div>
			        <form id="enroll-form" action="/admin/noticeboard-insert?${_csrf.parameterName}=${_csrf.token}" method="post">
				        <div class="modal-body">
				          <div class="row">
				            <div class="col-md-5 ml-auto">
				              <div class="info info-horizontal">
				                <div class="description">
				                  <h4 class="info-title">제목</h4>
				                  <div class="form-group">
				                  <div class="input-group">
				                      <textarea id="enroll-title" name="noticeBoardTitle" class="form-control" rows="15" placeholder="제목을 입력하세요"></textarea>
				                  </div>
				                </div>
				                </div>
				              </div>
				            </div>
				
				            <div class="col-md-5 mr-auto">
				              <div class="description">
				                <h4 class="info-title">내용</h4>
	                            <div class="form-group">
	                              <div class="form-group">
	                                <textarea id="enroll-content" name="noticeBoardContent" class="form-control" rows="15" placeholder="내용을 입력하세요"></textarea>
	                              </div>
	                            </div> 
	                          </div>         
				            </div>
				          </div>
				          <button id="enroll-submit" type="submit" class="btn btn-primary pull-right">등록</button>
		                  <button type="reset" class="btn btn-primary pull-right btn-r">초기화</button>   
				        </div>
			        </form>
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
                    <button data-toggle="modal" data-target="#signupModal">
    					<i class="material-icons">assignment</i>
    					글등록
					</button>
                    <div class="select-box">
	                    <select id="memberList-select" onchange="selectHandler(this);">
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
                    <table id="list-table" class="table">
                      <colgroup>
                   		<col width="10%">
                   		<col width="25%">
                   		<col width="45%">
                   		<col width="10%">
                   		<col width="10%">
                      </colgroup>
                      <thead class="text-primary text-center">
                        <th>
                          글번호
                        </th>
                        <th>
                          제목
                        </th>
                        <th>
                          내용
                        </th>
                        <th>
                          조회수
                        </th>
                        <th>
                          글작성일
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
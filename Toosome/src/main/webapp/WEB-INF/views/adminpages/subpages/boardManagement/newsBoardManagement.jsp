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
  <link href="/resources/css/adminpages/subpages/boardManagement/newsBoardManagement.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script src="/resources/js/adminpages/main/share/plugins/jasny-bootstrap.min.js"></script>
  <script src="/resources/js/adminpages/subpages/boardManagement/newsBoardManagement.js" defer></script>
  <script type="text/javascript">
 	const msg = "${msg}";
 	if(msg === "insertsuccess") {
 		alert("정상 등록되었습니다");
 	}else if(msg === "insertfail") {
 		alert("입력하신 정보가 올바르지 않습니다.");
 	}else if(msg === 'updatesuccess') {
 		alert("수정 완료");
 	}else if(msg === 'updatefail') {
 		alert("수정 실패");
 	}else if(msg === 'deletesuccess') {
 		alert("삭제 완료");
 	}else if(msg === 'deletefail') {
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
                  <h4 class=card-title>뉴스 게시판 관리</h4>
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
                             <span><strong>검색어(제목)</strong></span>
                           </td>
                           <td>
                             <input type="text" id="search-text" name="keyword" placeholder="검색어 입력">
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>작성일</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="newsDate" class="search-select" id="newsDate" onchange="changeHandler(this)">
                                <option value="notUse">미사용</option>
                                <option value="use">기간선택</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <div id="newsDatePeriod" class="date-picker">
                             	<button class="period news" value="0d">오늘</button>
                             	<button class="period news" value="1M">1개월</button>
                             	<button class="period news" value="3M">3개월</button>
                             	<button class="period news" value="6M">6개월</button>
                             	<button class="period news" value="1y">1년</button>
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
		                  <h4 class="card-title">뉴스 게시글 상세</h4>
		                </div>
		                <div class="card-body">
		                  <form id="update-form" action="/admin/newsboard-update?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">글번호</label>
		                          <input type="text" name="newsBoardId" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">조회수</label>
		                          <input type="email" name="newsBoardViewCount" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">작성일</label>
		                          <input type="date" name="newsBoardRegdate" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">제목</label>
		                          <input id="detail-title" type="text" name="newsBoardTitle" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row text-center">
		                      <div class="col-md-6">
		                      	<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img id="detail-img" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">본문 이미지 선택</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="uploadFile" accept="image/*" />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img id="thumbnail" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">썸네일 선택</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="uploadFile2" accept="image/*" />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                    </div>
		                    <input id="update-submit" type="submit" class="btn btn-primary pull-right" value="업데이트">
		                    <input type="button" class="btn btn-primary pull-right btn-r" onclick="delBtnFunc();" value="삭제">
		                    <input type="button" id="modal-cancel" class="btn btn-primary pull-right btn-r" value="취소">
		                    <div class="clearfix"></div>
		                    <input type="hidden" name="newsBoardId" />
		                    <input type="hidden" name="newsBoardDetailId" />
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
			        <form id="enroll-form" method="post" action="/admin/newsboard-insert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
				        <div class="modal-body">
				          <div class="row">
				            <div class="col-md-5 ml-auto">
				              <div class="info info-horizontal">
				                <div class="description">
				                  <h4 class="info-title">제목</h4>
				                  <div class="form-group">
				                  <div class="input-group">
				                      <input id="enroll-title" type="text" name="newsBoardTitle" class="form-control" placeholder="제목을 입력하세요">
				                  </div>
				                </div>
				                </div>
				              </div>
							  <div class="info info-horizontal">
				                <div class="description">
				                  <h4 class="info-title">썸네일</h4>
				                  <div class="text-center">
					                  <div class="fileinput fileinput-new text-center" data-provides="fileinput">
									    <div class="fileinput-new thumbnail img-raised">
									        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
									    </div>
									    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
									    <div>
									        <span class="btn btn-raised btn-round btn-default btn-file">
									            <span class="fileinput-new">이미지 선택</span>
									            <span class="fileinput-exists">수정</span>
									            <input id="enroll-thumb" type="file" name="uploadFile" accept="image/*" />
									        </span>	
									        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
									    </div>
									  </div>
				                  </div>
				                </div>
				              </div>
				             </div> 
				              <div class="col-md-5 mr-auto">
					              <div class="description">
					                  <h4 class="info-title">본문 이미지</h4>
					                  <div class="text-center">
						                  <div class="fileinput fileinput-new text-center" data-provides="fileinput">
										    <div class="fileinput-new thumbnail img-raised">
										        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
										    </div>
										    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
										    <div>
										        <span class="btn btn-raised btn-round btn-default btn-file">
										            <span class="fileinput-new">이미지 선택</span>
										            <span class="fileinput-exists">수정</span>
										            <input id="enroll-image" type="file" name="uploadFile2" accept="image/*" />
										        </span>	
										        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
										    </div>
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
                   		<col width="15%">
                   		<col width="35%">
                   		<col width="15%">
                   		<col width="15%">
                   		<col width="20%">
                      </colgroup>
                      <thead class="text-primary text-center">
                        <th>
                          글번호
                        </th>
                        <th>
                          제목
                        </th>
                        <th>
                          조회수
                        </th>
                        <th>
                          글작성일
                        </th>
                        <th>
                          이미지
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
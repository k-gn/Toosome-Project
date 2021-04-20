<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/boardManagement/newsBoardManagement.css" rel="stylesheet" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
  <script src="/resources/js/adminpages/subpages/boardManagement/newsBoardManagement.js" defer></script>
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
            <div id="board-modal" class="modal">
	            <div class="profile-container">
		            <div class="col-md-8">
		              <div class="card">
		                <div class="card-header card-header-primary">
		                  <h4 class="card-title">뉴스 게시글 상세</h4>
		                </div>
		                <div class="card-body">
		                  <form>
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">글번호</label>
		                          <input type="email" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">조회수</label>
		                          <input type="email" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">작성일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">제목</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">내용</label>
		                            <textarea class="form-control" rows="5"></textarea>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">이미지</label>
		                          <img class="img" src="" alt="#">
		                        </div>
		                      </div>
		                    </div>
		                    <button type="submit" class="btn btn-primary pull-right">업데이트</button>
		                    <button id="modal-cancel" class="btn btn-primary pull-right btn-r">취소</button>
		                    <button id="delete" class="btn btn-primary pull-right btn-r">삭제</button>
		                    <div class="clearfix"></div>
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
			        <form enctype="multipart/form-data">
				        <div class="modal-body">
				          <div class="row">
				            <div class="col-md-5 ml-auto">
				              <div class="info info-horizontal">
				                <div class="description">
				                  <h4 class="info-title">제목</h4>
				                  <div class="form-group">
				                  <div class="input-group">
				                      <input type="text" class="form-control" placeholder="제목을 입력하세요">
				                  </div>
				                </div>
				                </div>
				              </div>
							  <div class="info info-horizontal">
				                <div class="description">
				                  <h4 class="info-title">이미지</h4>
				                  <div class="form-group">
		                            <label class="bmd-label-floating">업로드</label>
		                            <input type="file" class="custom-file-input" id="file" accept="image/*">
		                            <label class="btn btn-success custom-file-label btn-s" for="file"></label>
		                          </div>
				                </div>
				              </div>
				            </div>
				
				            <div class="col-md-5 mr-auto">
				              <div class="description">
				                <h4 class="info-title">내용</h4>
	                            <div class="form-group">
	                              <div class="form-group">
	                                <textarea class="form-control" rows="10" placeholder="내용을 입력하세요"></textarea>
	                              </div>
	                            </div> 
	                          </div>         
				            </div>
				          </div>
				          <button type="submit" class="btn btn-primary pull-right">업데이트</button>
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
                    <table id="list-table" class="table">
                      <colgroup>
                   		<col width="10%">
                   		<col width="15%">
                   		<col width="35%">
                   		<col width="10%">
                   		<col width="10%">
                   		<col width="10%">
                   		<col width="10%">
                      </colgroup>
                      <thead class="text-primary" id="list-table-thead">
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
                        <th>
                          이미지
                        </th>
                        <th>
                          비고
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="newsBoardList" items="${newsBoardList}">
	                        <tr>
	                          <td>
	                            ${newsBoardList.newsBoardId}
	                          </td>
	                          <td>
	                            ${newsBoardList.newsBoardTitle}
	                          </td>
	                          <td>
	                            ${newsBoardList.newsBoardContent}
	                          </td>
	                          <td>
	                            ${newsBoardList.newsBoardViewCount}
	                          </td>
	                          <td>
	                            ${newsBoardList.newsBoardRegdate}
	                          </td>
	                          <td>
	                            <a href="${newsBoardList.newsBoardImageRoute}/${newsBoardList.newsBoardImageName}.${newsBoardList.newsBoardImageExtention}">상세보기</a>
	                          </td>
	                          <td>
	                            .
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
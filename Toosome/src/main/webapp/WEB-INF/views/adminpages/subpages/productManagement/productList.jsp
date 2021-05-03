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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  <script src="/resources/js/adminpages/main/share/plugins/jasny-bootstrap.min.js"></script>
  <link href="/resources/css/adminpages/subpages/productManagement/productList.css" rel="stylesheet" />
  <script src="/resources/js/adminpages/subpages/productManagement/productList.js" defer></script>
  <script type="text/javascript">
  	const parameterName = "${_csrf.parameterName}";
  	const token = "${_csrf.token}";
  	const msg = "${msg}";
	if(msg === "modSuccess") {
		alert("상품 수정 완료");
	}else if(msg === "modFail") {
		alert("상품 수정 실패");
	}else if(msg === "delSuccess") {
		alert("상품 삭제 완료");
	}else if(msg === "delFail") {
		alert("상품 삭제 실패");
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
                <div class="card-header card-header-success">
                  <h4 class=card-title>상품 리스트</h4>
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
                                <option value="id">상품번호</option>
                                <option value="name">상품이름</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <input type="text" id="search-text" name="keyword" placeholder="검색어 입력">
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>카테고리</strong></span>
                           </td>
                           <td>
                        	  <div class="select-box">
                              <select name="isNew" class="search-select" id="isNew">
                                <option value="2">전체상품</option>
                                <option value="0">구상품</option>
                                <option value="1">신상품</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                        	  <div class="select-box">
                              <select name="categories" class="search-select" id="categories">
                                <option value="0">전체상품</option>
                                <option value="1">커피상품</option>
                                <option value="2">커피웨어/기타</option>
                                <option value="3">기프트세트</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>판매상태</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="searchType" class="search-select" id="state">
                              	<option value="4">전체상품</option>
                                <option value="0">판매중지</option>
                                <option value="1">판매중</option>
                                <option value="2">품절</option>
                                <option value="3">단종</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
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
		                <div class="card-header card-header-success">
		                  <h4 class="card-title">상품 상세</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form name="formObj" action="/admin/modProduct?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		                    <div class="row">
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품번호</label>
		                          <input type="text" name="id" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">판매상태</label>
		                          <select class="custom-select" id="modal-state" name="productState">
				                  	<option value="0">판매중지</option>
				                  	<option value="1">판매중</option>
				                  	<option value="2">품절</option>
				                  	<option value="3">단종</option>
				                  </select>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">신메뉴여부</label>
		                          <select class="custom-select" id="modal-isNew" name="productNew">
				                  	<option value="1">신상품</option>
				                  	<option value="0">구상품</option>
				                  </select>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">카테고리</label>
		                          <select class="custom-select" id="modal-categories" name="productType">
				                  	<option value="1">커피상품</option>
				                  	<option value="2">커피웨어/기타</option>
				                  	<option value="3">기프트세트</option>
				                  </select>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
			                  <div class="col-md-12">
			                    <div class="form-group">
			                      <label class="bmd-label-floating">상품이름</label>
			                      <input type="text" class="form-control" name="productMainTitle">
			                    </div>
			                  </div>
		                    </div>
		                    <div class="row">
			                  <div class="col-md-12">
			                    <div class="form-group">
	  	                          <label class="bmd-label-floating">상품이름(상세)</label>
		                          <input type="text" class="form-control" name="productSubTitle">
			                    </div>
			                  </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">상품 내용</label>
		                            <input type="text" class="form-control" name="productContent">
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품가격</label>
		                          <input type="text" class="form-control" name="productPrice">
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">재고수량</label>
		                          <input type="text" class="form-control" name="productCheckCount">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">판매시작일</label>
		                          <input type="date" class="form-control" name="productStartDate">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
							  <div class="col-md-12 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img id="productImg" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">이미지 선택</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="file" id="file" accept="image/*" />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                    </div>
		                    <button type="submit" class="btn btn-success pull-right">업데이트</button>
		                    <button class="btn btn-success pull-right btn-r" onclick="delBtnFunc();">삭제</button>
		                    <button id="modal-cancel" class="btn btn-success pull-right btn-r">취소</button>
		                    <div class="clearfix"></div>
		                    <input type="hidden" name="productId">
		                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                    <input type="hidden" name="oldImageName">
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
                <div class="card-header card-header-success">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '상품리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
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
                    <table id="member-table" class="table">
                      <thead class="text-success text-center">
                        <th>
                          상품번호
                        </th>
                        <th>
                          카테고리
                        </th>
                        <th>
                          상품이름
                        </th>
                        <th>
                          판매상태
                        </th>
                        <th>
                          재고수량
                        </th>
                        <th>
                          상품가격
                        </th>
                        <th>
                          상품등록일
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
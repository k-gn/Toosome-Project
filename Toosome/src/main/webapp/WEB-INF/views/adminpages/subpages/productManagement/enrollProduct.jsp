<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
<title>Toosomeplace - Admin</title>
<!-- meta & link -->
<jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
<link
	href="/resources/css/adminpages/subpages/productManagement/enrollProduct.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="/resources/js/adminpages/main/share/plugins/jasny-bootstrap.min.js"></script>
<script
	src="/resources/js/adminpages/subpages/productManagement/enrollProduct.js"
	defer></script>
</head>

<body>
	<div class="wrapper">
		<!-- Sidebar -->
		<jsp:include
			page="/WEB-INF/views/adminpages/share/sidebar/sidebar.jsp"></jsp:include>
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
		                  <h4 class="card-title">상품 등록</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form enctype="multipart/form-data">
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품이름</label>
		                          <input type="text" id="name1" name="productMainTitle" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품이름(상세)</label>
		                          <input type="text" id="name2" name="productSubTitle" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <select class="custom-select" name="productType" id="category">
				                  	<option value="">카테고리</option>
				                  	<option value="1">커피상품</option>
				                  	<option value="2">커피웨어/기타</option>
				                  	<option value="3">기프트세트</option>
				                  </select>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <select class="custom-select" name="productState" id="state">
				                  	<option value="">판매상태</option>
				                  	<option value="0">판매대기</option>
				                  	<option value="1">판매중</option>
				                  </select>
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <select class="custom-select" name="productNew" id="isNew">
				                  	<option value="">신메뉴 여부</option>
				                  	<option value="1">신메뉴</option>
				                  	<option value="0">구메뉴</option>
				                  </select>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">상품가격</label>
		                          <input type="text" id="price" name="productPrice" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">재고수량</label>
		                          <input type="text" id="count" name="productCheckCount" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group cal">
		                          <label class="bmd-label-floating">판매시작일</label>
	                              <input id="calendar3" class="calendar" type="date" name="productStartDay" value="">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">상품내용</label>
		                            <textarea class="form-control" id="content" rows="3" name="productContent" ></textarea>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12 text-center">
		                        <div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
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
		                    <button id="productBtn" type="submit" class="btn btn-success pull-right">등록</button>
		                    <button type="reset" class="btn btn-success pull-right btn-r">초기화</button>
		                    <div class="clearfix"></div>
		                  </form>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
			<!-- Footer -->
			<jsp:include
				page="/WEB-INF/views/adminpages/share/footer/footer.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>
</body>
</html>
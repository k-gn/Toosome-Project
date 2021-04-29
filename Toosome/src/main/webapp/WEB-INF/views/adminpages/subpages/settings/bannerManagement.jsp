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
	href="/resources/css/adminpages/subpages/settings/bannerManagement.css"
	rel="stylesheet" />
<script src="/resources/js/adminpages/main/share/plugins/jasny-bootstrap.min.js"></script>
<script
	src="/resources/js/adminpages/subpages/settings/bannerManagement.js"
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
		                  <h4 class="card-title">배너 등록</h4>
		                  <p class="card-category">배너 이미지를 수정할 수 있습니다</p>
		                </div>
		                <div class="card-body">
		                  <form action="#" enctype="multipart/form-data">
		                  	<br>
							<div class="row">
							  <div class="col-md-3 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">배너1</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="..." />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-3 text-center">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입력1</label>
		                          <input type="text" class="form-control">
		                        </div>
		                        <button type="button" class="close delete">
			          				<i class="material-icons">clear</i>
			          			</button>
		                      </div>
		                      <div class="col-md-3 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">배너2</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="..." />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-3 text-center">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입력2</label>
		                          <input type="text" class="form-control">
		                        </div>
		                        <button type="button" class="close delete">
			          				<i class="material-icons">clear</i>
			          			</button>
		                      </div>
							</div>
							<br>
							<div class="row">
							  <div class="col-md-3 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">배너3</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="..." />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-3 text-center">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입력3</label>
		                          <input type="text" class="form-control">
		                        </div>
		                        <button type="button" class="close delete">
			          				<i class="material-icons">clear</i>
			          			</button>
		                      </div>
		                      <div class="col-md-3 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">배너4</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="..." />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-3 text-center">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입력4</label>
		                          <input type="text" class="form-control">
		                        </div>
		                        <button type="button" class="close delete">
			          				<i class="material-icons">clear</i>
			          			</button>
		                      </div>
							</div>
							<br>
							<div class="row">
							  <div class="col-md-3 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">배너5</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="..." />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-3 text-center">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입력5</label>
		                          <input type="text" class="form-control">
		                        </div>
		                        <button type="button" class="close delete">
			          				<i class="material-icons">clear</i>
			          			</button>
		                      </div>
		                      <div class="col-md-3 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">배너6</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="..." />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
								    </div>
								</div>
		                      </div>
		                      <div class="col-md-3 text-center">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">입력6</label>
		                          <input type="text" class="form-control">
		                        </div>
		                        <button type="button" class="close delete">
			          				<i class="material-icons">clear</i>
			          			</button>
		                      </div>
							</div>
		                    <button type="submit" class="btn btn-success pull-right">등록</button>
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
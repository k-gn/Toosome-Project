<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
<title>Toosomeplace - Admin</title>
<!-- meta & link -->
<jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
	<link href="/resources/css/adminpages/subpages/membershipManagement/membershipManagement.css" rel="stylesheet" />
	<script src="/resources/js/adminpages/main/share/plugins/jasny-bootstrap.min.js"></script>
	<script src="/resources/js/adminpages/subpages/membershipManagement/membershipManagement.js" defer></script>
	<script type="text/javascript">
		let csrfName = "${_csrf.parameterName}";
		let csrfToken = "${_csrf.token}";
		const lid = "${lid}";
	    const msg = "${msg}";
		if(msg === "modSuccess") {
			alert("멤버쉽 정보 수정 완료");
		}
	</script>
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
		                <div class="card-header card-header-info">
		                  <div class="title-container">
			                  <h4 class="card-title">멤버십 관리</h4>
			                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                  </div>
		                  <select class="custom-select" id="lvl" onchange="changeLevel()">
		                  </select>
		                </div>
		                <div class="card-body">
		                  <form role='form' enctype="multipart/form-data" action="/admin/addlvl?${_csrf.parameterName}=${_csrf.token}" method="post">
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">멤버십 번호</label>
		                          <input type="text" name="id" value="${lid}" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">멤버십 이름</label>
		                          <input type="text" name="levelName" id="name" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">등급 조건 (MIN)</label>
		                          <input type="text" name="levelMinRange" id="min" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">등급 조건 (MAX)</label>
		                          <input type="text" name="levelMaxRange" id="max" class="form-control" disabled>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">할인율 (%)</label>
		                          <input type="text" name="levelDiscountRate" id="rate1" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">적립률 (%)</label>
		                          <input type="text" name="levelPointRate" id="rate2" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">배송비</label>
		                          <input type="text" name="levelDeliveryPay" id="dpay" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
							  <div class="col-md-12 text-center">
								<div class="fileinput fileinput-new text-center" data-provides="fileinput">
								    <div class="fileinput-new thumbnail img-raised">
								        <img id="lvlImg" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/admin/subpages/setting/blank.png" rel="nofollow" alt="...">
								    </div>
								    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
								    <div>
								        <span class="btn btn-raised btn-round btn-default btn-file">
								            <span class="fileinput-new">이미지 선택</span>
								            <span class="fileinput-exists">수정</span>
								            <input type="file" name="file" id="file" />
								        </span>	
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
								    </div>
								</div>
		                      </div>
		                    </div>
		                    <button type="submit" id="lvlBtn" class="btn btn-info pull-right">등록</button>
		                    <button type="reset" class="btn btn-info pull-right btn-r">초기화</button>
		                    <input type="hidden" name="levelId" />
		                    <input type="hidden" name="levelImg" />
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
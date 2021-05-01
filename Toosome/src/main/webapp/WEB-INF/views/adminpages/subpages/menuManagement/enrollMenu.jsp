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
	href="/resources/css/adminpages/subpages/menuManagement/enrollMenu.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="/resources/js/adminpages/main/share/plugins/jasny-bootstrap.min.js"></script>
<script
	src="/resources/js/adminpages/subpages/menuManagement/enrollMenu.js"
	defer></script>
	 <script type="text/javascript">
	    const msg = "${msg}";
		if(msg === "success") {
			alert("메뉴 등록 완료");
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
		                <div class="card-header card-header-success">
		                  <h4 class="card-title">메뉴 등록</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form role='form' enctype="multipart/form-data" action="/admin/addMenu?${_csrf.parameterName}=${_csrf.token}" method="post">
		                    <div class="row">
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 이름</label>
		                          <input type="text" id="name1" name="menuMainTitle" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 이름(서브)</label>
		                          <input type="text"  id="name2" name="menuSubTitle" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-4">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 가격</label>
		                          <input type="text" id="price" name="menuPrice" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <select class="custom-select" name="menuType" id="category">
				                  	<option value="">카테고리</option>
				                  	<option value="1">음료</option>
				                  	<option value="2">디저트</option>
				                  	<option value="3">델리</option>
				                  	<option value="4">홀케이크</option>
				                  </select>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">재고수량</label>
		                          <input type="text" id="count" name="menuCheckCount" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <select class="custom-select" name="menuState" id="state">
				                  	<option value="">판매상태</option>
				                  	<option value="0">판매대기</option>
				                  	<option value="1">판매중</option>
				                  </select>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <select class="custom-select" name="menuNew" id="isNew">
				                  	<option value="">신메뉴 여부</option>
				                  	<option value="1">YES</option>
				                  	<option value="0">NO</option>
				                  </select>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">판매 시작일</label>
		                          <div class="calendar-wrapper">
								    <input id="calendar3" class="calendar" type="date" name="menuStartDay" value="">
                             	  </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">메뉴 내용</label>
		                            <textarea class="form-control" id="content" name="menuContent" rows="3"></textarea>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">총 제공량</label>
		                            <input type="text" id="full" name="iatVO.iatFullSupply" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">1회 제공량</label>
		                            <input type="text" id="one" name="iatVO.iatOneSupply" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">중량(g) / 용량(ml)</label>
		                            <input type="text" id="weight" name="iatVO.iatWeight" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">열량(kcal)</label>
		                            <input type="text" id="kcal" name="iatVO.iatKcal" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">당류(g/%)</label>
		                            <input type="text" id="sugar" name="iatVO.iatSugars" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">단백질(g/%)</label>
		                            <input type="text" id="protein" name="iatVO.iatProtein" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">포화지방(g/%)</label>
		                            <input type="text" id="fat" name="iatVO.iatSaturatedFat" class="form-control">
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col-md-2">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">나트륨(g/%)</label>
		                            <input type="text" id="natrium" name="iatVO.iatNatrium" class="form-control">
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
								        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
								    </div>
								</div>
		                      </div>
		                    </div>
		                    <button id="menuBtn" type="submit" class="btn btn-success pull-right">등록</button>
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
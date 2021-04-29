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
	<script type="text/javascript">
		const msg = "${msg}";
		if(msg === "success") {
			alert("배너를 수정하였습니다.");
		}else if(msg === "fail") {
			alert("배너 수정을 실패하였습니다.");
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
		                  <h4 class="card-title">배너 등록</h4>
		                  <p class="card-category">배너 이미지를 수정할 수 있습니다</p>
		                </div>
		                <div class="card-body">
		                  <form action="/admin/addBanner?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		                  	<br>
							<div class="row">
							  <c:forEach begin="1" end="6" varStatus="i">
							  		<!-- /img/pages/admin/subpages/setting/blank.png -->
								  <div class="col-md-3 text-center">
									<div class="fileinput fileinput-new text-center" data-provides="fileinput">
									    <div class="fileinput-new thumbnail img-raised">
									        <img src="${path}${bannerList[i.count - 1].bannerRoute == null ? '/img/pages/admin/subpages/setting/' : bannerList[i.count - 1].bannerRoute}${bannerList[i.count - 1].bannerName == null ? 'blank.png' : bannerList[i.count - 1].bannerName}" 
									        	 rel="nofollow" alt="...">
									    </div>
									    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
									    <div>
									        <span class="btn btn-raised btn-round btn-default btn-file">
									            <span class="fileinput-new">배너${i.count}</span>
									            <span class="fileinput-exists">수정</span>
									            <input type="file" name="bannerList[${i.count - 1}].file" />
									        </span>	
									        <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i>삭제</a>
									    </div>
									</div>
			                      </div>
			                      <div class="col-md-3 text-center">
			                        <div class="form-group">
			                          <label class="bmd-label-floating">제목${i.count}</label>
			                          <input type="text" class="form-control" name="bannerList[${i.count - 1}].bannerTitle" value="${bannerList[i.count - 1].bannerTitle}">
			                        </div>
                             		<button type="button" class="close delete">
			          				  <i class="material-icons">clear</i>
			          			    </button>
			                      </div>
			                      <input type="hidden" name="bannerList[${i.count - 1}].bannerId" value="${bannerList[i.count - 1].bannerId}">
			                      <input type="hidden" name="bannerList[${i.count - 1}].originImgName" value="${bannerList[i.count - 1].bannerName}">
							  </c:forEach>
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
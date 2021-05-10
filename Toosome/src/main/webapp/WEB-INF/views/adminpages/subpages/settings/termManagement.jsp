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
	href="/resources/css/adminpages/subpages/settings/termManagement.css"
	rel="stylesheet" />
<script type="text/javascript">
	const msg = "${msg}";
	if(msg === "success") {
		alert("약관을 수정하였습니다.");
	}else if(msg === "fail") {
		alert("약관을 수정을 실패하였습니다.");
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
		                  <h4 class="card-title">약관 관리</h4>
		                  <p class="card-category">약관을 수정할 수 있습니다</p>
		                </div>
		                <div class="card-body">
		                  	<c:forEach var="term" items="${termList}" varStatus="i">
			                  <form action="/admin/addTerm" method="post">	        
				                    <div class="row">
				                      <div class="col-md-12">
				                        <div class="form-group">
				                          <div class="form-group">
				                            <label class="bmd-label-floating">${term.termsTitle}</label>
				                            <textarea class="form-control" name="termsContent" rows="20">${term.termsContent}</textarea>
				                            <input type="hidden" name="termsId" value="${term.termsId}">
				                          </div>
				                        </div>
				                      </div>
				                    </div>
			                    <button type="submit" class="btn btn-success pull-right">업데이트</button>
			                    <button type="reset" class="btn btn-success pull-right btn-r">초기화</button>
			                    <div class="clearfix"></div>
			                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			                  </form>
		                  	</c:forEach>         
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
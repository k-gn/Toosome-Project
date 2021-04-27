<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Toosomeplace - Admin</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- Material Kit CSS -->
<link
	href="/resources/css/adminpages/share/material-dashboard.css?v=2.1.2"
	rel="stylesheet" />
<link rel="shortcut icon" href="/resources/img/AnyConv.com__favicon.ico"
	type="image/x-icon" />
<link
	href="/resources/css/adminpages/subpages/adminManagement/adminNew.css"
	rel="stylesheet" />
<script
	src="/resources/js/adminpages/subpages/adminManagement/adminNew.js"
	defer></script>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-4">
							<div class="card card-profile">
								<div class="card-body">
									<h4 class="card-title">운영자 등록</h4>
									<h6 class="card-category text-gray">운영자 등록 시 작성한 이메일 주소로 알림 메일이 발송됩니다.</h6>
									<form action="#">
										<div class="flex-temp">
											<span class="card-description">권한설정:</span>
											<select class="custom-select">
												<option value="">권한이름</option>
												<option value="ROLE_HEAD">ROLE_HEAD</option>
												<option value="ROLE_ADMIN">ROLE_ADMIN</option>
											</select>
										</div>
										<div class="flex-temp">
											<span class="card-description">운영자명:</span>
											<input type="text" class="form-control" placeholder="운영자명을 입력하세요">
										</div>
										<div class="flex-temp">
											<span class="card-description">이메일:</span>
											<input type="email" class="form-control" placeholder="이메일을 입력하세요">
										</div>
										<button type="submit" class="btn btn-rose btn-round">등록</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
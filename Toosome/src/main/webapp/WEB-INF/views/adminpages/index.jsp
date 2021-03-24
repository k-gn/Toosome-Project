<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="resources/css/adminpages/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <link href="resources/css/adminpages/admin_main.css" rel="stylesheet" />
</head>

<body>
  <div class="wrapper">
    <div class="sidebar" data-color="danger" data-background-color="white">
      <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
      <div class="logo">
        <a href="/web/" class="simple-text logo-mini">
          ToosomePlace
        </a>
        <a href="https://github.com/k-gn/Toosome" class="simple-text logo-normal">
          Creative Team
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active  ">
            <a class="nav-link" href="#0">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
          <!-- nav item start -->
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="material-icons">content_paste</i>
              <p>회원 관리</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="material-icons">contact_page</i>
              <p>운영자 관리</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="material-icons">shopping_cart</i>
              <p>상품 관리</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="material-icons">location_ons</i>
              <p>주문/배송 관리</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="material-icons">table_view</i>
              <p>판매 현황</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="material-icons">language</i>
              <p>통계</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="material-icons">library_books</i>
              <p>게시판 관리</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="material-icons">build</i>
              <p>설정</p>
            </a>
            <div class="sub-nav member">
              <ul>
           		<li>회원 리스트</li>
           		<li>휴면회원 관리</li>
           		<li>탈퇴회원 관리</li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="javascript:;">
                  <i class="material-icons">notifications</i> Notifications
                </a>
              </li>
              <!-- your navbar here -->
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <!-- your content here -->
        </div>
      </div>
      <footer class="footer">
        <div class="container-fluid">
          <nav class="float-left">
            <ul>
              <li>
                <a href="https://github.com/k-gn/Toosome">
                  Creative Team
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright float-right">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="https://github.com/k-gn/Toosome" target="_blank">Creative Team</a> for a better web.
          </div>
          <!-- your footer here -->
        </div>
      </footer>
    </div>
  </div>
  <script src="resources/js/adminpages/admin_main.js"></script>
</body>

</html>
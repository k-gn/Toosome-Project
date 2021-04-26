<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/main/admin_main.css" rel="stylesheet" />
  <script src="/resources/js/adminpages/main/share/plugins/chartist.min.js"></script>
  <script src="/resources/js/adminpages/main/admin_main.js" defer></script>
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
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">content_copy</i>
                  </div>
                  <p class="card-category">전날 주문건수</p>
                  <h3 class="card-title">10
                    <small>건</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                     <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">store</i>
                  </div>
                  <p class="card-category">전날 매출액</p>
                  <h3 class="card-title">4,000,000
                  	<small>원</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">people</i>
                  </div>
                  <p class="card-category">전날 접속자수</p>
                  <h3 class="card-title">${visitCount}
                  	<small>명</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">person_add</i>
                  </div>
                  <p class="card-category">전날 가입자수</p>
                  <h3 class="card-title">${regCount}
                  	<small>명</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <div class="card card-chart">
                <div class="card-header card-header-success">
                  <div class="ct-chart" id="dailySalesChart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">데일리 세일즈</h4>
                  <p class="card-category">
                    <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i> updated 4 minutes ago
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card card-chart">
                <div class="card-header card-header-warning">
                  <div class="ct-chart" id="websiteViewsChart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">데일리 접속자수</h4>
                  <p class="card-category">
                  	<span class="text-success"><i class="fa fa-long-arrow-up"></i> 30% </span> increase in today sales.</p>
                </div>
                <div class="card-footer">
                  <div class="stats">
                   <i class="material-icons">access_time</i> updated 4 minutes ago
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card card-chart">
                <div class="card-header card-header-danger">
                  <div class="ct-chart" id="completedTasksChart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">데일리 주문건수</h4>
                  <p class="card-category">
                  	<span class="text-success"><i class="fa fa-long-arrow-up"></i> 30% </span> increase in today sales.</p>
                </div>
                <div class="card-footer">
                  <div class="stats">
                   <i class="material-icons">access_time</i> updated 4 minutes ago
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header card-header-tabs card-header-primary">
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <span class="nav-tabs-title">목록 :</span>
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <a class="nav-link active" href="#notice" data-toggle="tab">
                            <i class="material-icons">content_paste</i> 공지사항
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#qna" data-toggle="tab">
                            <i class="material-icons">quiz</i> 문의사항
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#issue" data-toggle="tab">
                            <i class="material-icons">task</i> 이슈
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane active" id="notice">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td><a href="#">Sign contract for "What are conference organizers afraid of?"</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="tab-pane" id="qna">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td><a href="#">Flooded: One year later, assessing what was lost and what was found when a ravaging</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="tab-pane" id="issue">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>
                              <div class="form-check">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="checkbox" value="">
                                  <span class="form-check-sign">
                                    <span class="check"></span>
                                  </span>
                                </label>
                              </div>
                            </td>
                            <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                            <td class="td-actions text-right">
                              <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-link btn-sm">
                                <i class="material-icons">edit</i>
                              </button>
                              <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-link btn-sm">
                                <i class="material-icons">close</i>
                              </button>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header card-header-warning">
                  <h4 class="card-title">매뉴얼 리스트</h4>
                  <p class="card-category">마지막 업데이트 일자 : 2021, 05</p>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <tbody>
                      <tr>
                        <td><a href="#"><i class="material-icons">production_quantity_limits</i>&nbsp;&nbsp;&nbsp;상품관리 매뉴얼</a></td>
                      </tr>
                      <tr>
                        <td><a href="#"><i class="material-icons">inbox</i>&nbsp;&nbsp;&nbsp;주문/취소 매뉴얼</a></td>
                      </tr>
                      <tr>
                        <td><a href="#"><i class="material-icons">imagesearch_roller</i>&nbsp;&nbsp;&nbsp;디자인 매뉴얼</a></td>
                      </tr>
                      <tr>  
                        <td><a href="#"><i class="material-icons">settings</i>&nbsp;&nbsp;&nbsp;설정/기타 매뉴얼</a></td>
                      </tr>
                      <tr>  
                        <td><a href="#"><i class="material-icons">device_unknown</i>&nbsp;&nbsp;&nbsp;모바일 어드민 매뉴얼</a></td>
                      </tr>
                    </tbody>
                  </table>
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
  </div>
  <script>
    // 차트 그리기
    $(document).ready(function() {
      let dailyVisit = "${dailyVisit}";
      console.log(dailyVisit);
      ct.initDashboardPageCharts();
    });
    
    // 윈도우 리사이즈시 차트 다시 그리기
    $(window).resize(function () {
   	  // reset the seq for charts drawing animations
   	  seq = seq2 = 0;

   	  setTimeout(function () {
   	    ct.initDashboardPageCharts();
   	  }, 500);
    });
  </script>
</body>
</html>
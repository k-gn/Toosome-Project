<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/statistics/statistics.css" rel="stylesheet" />
  <script src="/resources/js/adminpages/main/share/plugins/chartist.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>  
  <script src="/resources/js/adminpages/subpages/statistics/statistics.js" defer></script>
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
                <div class="card-header card-header-info">
                  <h4 class="card-title">통계</h4>                
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                     <table class="table">
                     	<colgroup>
                     		<col width="15%">
                     		<col width="70%">
                     		<col width="15%">
                     	</colgroup>
                       <tbody>
                         <tr>
                           <td>
                             <span><strong>기간</strong></span>
                           </td>
                           <td>
                             <div class="date-picker">
                             	<div class="period-btn-box">
	                             	<button class="period" value="0d">오늘</button>
	                             	<button class="period" value="1M">1개월</button>
	                             	<button class="period" value="3M">3개월</button>
	                             	<button class="period" value="6M">6개월</button>
	                             	<button class="period" value="1y">1년</button>                             	
                             	</div>
                             	<div class="calendar-wrapper">
	                              	<div class="col-md-6">
	                              		<div class="form-group">
	                              			<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
	                              				<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" id="calendar1">
	                              				<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
	                              					<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                              				</div>
	                              			</div>
	                              		</div>
	                              	</div>
	                              	<span>&nbsp;~&nbsp;</span>
	                              	<div class="col-md-6">
	                              		<div class="form-group">
	                              			<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
	                              				<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" id="calendar2">
	                              				<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
	                              					<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                              				</div>
	                              			</div>
	                              		</div>
	                              	</div>
                             	</div>
                             </div>
                           </td>
                           <td>
                             <button type="submit" class="btn btn-warning pull-right">검색</button>
                           </td>
                         </tr>
                       </tbody>
                     </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">content_copy</i>
                  </div>
                  <p class="card-category">총 결제금액</p>
                  <h3 class="card-title">9,387,000
                    <small>원</small>
                  </h3>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">store</i>
                  </div>
                  <p class="card-category">총 판매이익</p>
                  <h3 class="card-title">7,283,000
                  	<small>원</small>
                  </h3>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">people</i>
                  </div>
                  <p class="card-category">총 판매건수</p>
                  <h3 class="card-title">82
                  	<small>건</small>
                  </h3>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">person_add</i>
                  </div>
                  <p class="card-category">선택날짜</p>
                  <h3 class="card-title">
                  	<small>2021-04-19</small>
                  	<small>~</small>
                  	<small>2021-04-20</small>
                  </h3>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <div class="card card-chart">
                <div class="card-header card-header-info">
                  <div class="ct-chart" id="salesChart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">결제금액 추이</h4>
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
                <div class="card-header card-header-info">
                  <div class="ct-chart" id="caseChart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">판매건수 추이</h4>
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
                <div class="card-header card-header-info">
                  <div class="ct-chart" id="profitChart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">판매이익 추이</h4>
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
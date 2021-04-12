<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/memberManagement/memberManagement.css" rel="stylesheet" />
  <script src="/resources/js/adminpages/subpages/memberManagement/memberManagement.js" defer></script>
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
                <div class="card-header card-header-primary">
                  <h4 class=card-title>회원 리스트</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <form action="">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>
                              <span>검색어</span>
                            </td>
                            <td>
                              <select name="searchType">
                                <option value="all">전체</option>
                                <option value="id">ID(E-mail)</option>
                                <option value="name">이름</option>
                              </select>
                              <input type="text" id="search-text" name="keyword" placeholder="검색어 입력">
                            </td>
                          </tr>
                          
                        </tbody>
                      </table>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">검색 결과: 6건</h4>
                  <div class="list-btn-box">
                    <button><i class="material-icons">fact_check</i>엑셀 다운로드</button>
                    <select id="memberList-select">
                      <option value="30">30개씩 보기</option>
                      <option value="50">50개씩 보기</option>
                      <option value="100">100개씩 보기</option>
                      <option value="200">200개씩 보기</option>
                    </select>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          회원번호
                        </th>
                        <th>
                          가입유형
                        </th>
                        <th>
                          ID(E-mail)
                        </th>
                        <th>
                          이름
                        </th>
                        <th>
                          핸드폰 번호
                        </th>
                        <th>
                          회원가입일
                        </th>
                        <th>
                          최종로그인
                        </th>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            1
                          </td>
                          <td>
                            KAKAO
                          </td>
                          <td>
                            powerlsh0103@naver.com
                          </td>
                          <td>
                            임성현
                          </td>
                          <td>
                            010-2605-9213
                          </td>
                          <td>
                            2020-03-25
                          </td>
                          <td>
                            2020-04-10
                          </td>
                        </tr>
                        <tr>
                          <td>
                            2
                          </td>
                          <td>
                            NAVER
                          </td>
                          <td>
                            powerlsh0103@naver.com
                          </td>
                          <td>
                            임성현
                          </td>
                          <td>
                            010-2605-9213
                          </td>
                          <td>
                            2020-03-25
                          </td>
                          <td>
                            2020-04-10
                          </td>
                        </tr>
                        <tr>
                          <td>
                            3
                          </td>
                          <td>
                            KAKAO
                          </td>
                          <td>
                            powerlsh0103@naver.com
                          </td>
                          <td>
                            임성현
                          </td>
                          <td>
                            010-2605-9213
                          </td>
                          <td>
                            2020-03-25
                          </td>
                          <td>
                            2020-04-10
                          </td>
                        </tr>
                        <tr>
                          <td>
                            4
                          </td>
                          <td>
                            NORMAL
                          </td>
                          <td>
                            powerlsh0103@naver.com
                          </td>
                          <td>
                            임성현
                          </td>
                          <td>
                            010-2605-9213
                          </td>
                          <td>
                            2020-03-25
                          </td>
                          <td>
                            2020-04-10
                          </td>
                        </tr>
                        <tr>
                          <td>
                            5
                          </td>
                          <td>
                            KAKAO
                          </td>
                          <td>
                            powerlsh0103@naver.com
                          </td>
                          <td>
                            임성현
                          </td>
                          <td>
                            010-2605-9213
                          </td>
                          <td>
                            2020-03-25
                          </td>
                          <td>
                            2020-04-10
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
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
</body>
</html>
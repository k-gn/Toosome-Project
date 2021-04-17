<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
  <title>Toosomeplace - Admin</title>
  <!-- meta & link -->
  <jsp:include page="/WEB-INF/views/adminpages/share/head/head.jsp"></jsp:include>
  <link href="/resources/css/adminpages/subpages/menuManagement/menuList.css" rel="stylesheet" />
  <script src="/resources/js/adminpages/subpages/menuManagement/menuList.js" defer></script>
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
                <div class="card-header card-header-success">
                  <h4 class=card-title>메뉴 리스트</h4>
                  <div class="list-btn-box">
                    <button id="search-reset"><i class="material-icons">restart_alt</i>초기화</button>
                    <button id="search-submit"><i class="material-icons">search</i>검색</button>  
                  </div>                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                     <table class="table">
                     	<colgroup>
                     		<col width="15%">
                     		<col width="85%">
                     	</colgroup>
                       <tbody>
                         <tr>
                           <td>
                             <span><strong>검색어</strong></span>
                           </td>
                           <td>
                             <div class="select-box">
                              <select name="searchType" class="search-select" id="searchType">
                                <option value="id">메뉴번호</option>
                                <option value="name">메뉴이름</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                             <input type="text" id="search-text" name="keyword" placeholder="검색어 입력">
                           </td>
                         </tr>
                         <tr>
                           <td>
                             <span><strong>카테고리</strong></span>
                           </td>
                           <td>
                        	  <div class="select-box">
                              <select name="categories" class="search-select" id="categories">
                                <option value="new">NEW</option>
                                <option value="wholecake">홀케이크</option>
                                <option value="delhi">델리</option>
                                <option value="dessert">디저트</option>
                                <option value="beverage">음료</option>
                              </select>
                              <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                             </div>
                           </td>
                         </tr>         
                       </tbody>
                     </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="profile-modal" class="modal">
	            <div class="profile-container">
		            <div class="col-md-8">
		              <div class="card">
		                <div class="card-header card-header-success">
		                  <h4 class="card-title">메뉴 상세</h4>
		                  <p class="card-category">빈 칸을 모두 입력하세요</p>
		                </div>
		                <div class="card-body">
		                  <form>
		                    <div class="row">
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 번호</label>
		                          <input type="text" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 이름</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 이름(상세)</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 가격</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">카테고리</label>
		                          <input type="text" class="form-control" disabled>
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">재고수량</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">판매상태</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-3">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">신메뉴 여부</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">메뉴 등록일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                      <div class="col-md-6">
		                        <div class="form-group">
		                          <label class="bmd-label-floating">판매 시작일</label>
		                          <input type="text" class="form-control">
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">메뉴 내용</label>
		                            <textarea class="form-control" rows="5"></textarea>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-md-12">
		                        <div class="form-group">
		                          <div class="form-group">
		                            <label class="bmd-label-floating">메뉴 이미지</label>
		                            <textarea class="form-control" rows="5"></textarea>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <button type="submit" class="btn btn-success pull-right">업데이트</button>
		                    <button id="modal-cancel" class="btn btn-success pull-right btn-r">취소</button>
		                    <div class="clearfix"></div>
		                  </form>
		                </div>
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
                <div class="card-header card-header-success">
                  <h4 class="card-title" id="search-result">검색 결과: 0건</h4>
                  <div class="list-btn-box">
                    <button id="excel-down" onclick="excelDownload('member-table', '메뉴리스트');"><i class="material-icons">fact_check</i>엑셀 다운로드</button>
                  	<div class="select-box">
	                    <select id="memberList-select">
	                      <option value="30">30개씩 보기</option>
	                      <option value="50">50개씩 보기</option>
	                      <option value="100">100개씩 보기</option>
	                      <option value="200">200개씩 보기</option>
	                    </select>
	                    <div class="arrow-down"><i class="material-icons">arrow_drop_down</i></div>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table id="member-table" class="table">
                      <thead class="text-success" id="list-table-thead">
                        <th>
                          메뉴번호
                        </th>
                        <th>
                          카테고리
                        </th>
                        <th>
                          메뉴이름
                        </th>
                        <th>
                          판매상태
                        </th>
                        <th>
                          재고수량
                        </th>
                        <th>
                          메뉴가격
                        </th>
                        <th>
                          메뉴등록일
                        </th>
                      </thead>
                      <tbody>
                     	 <c:forEach var="menuList" items="${menuList}">
	                        <tr>
	                          <td>
	                            ${menuList.menuId}
	                          </td>
	                          <td>
	                            ${menuList.menuType}
	                          </td>
	                          <td>
	                            ${menuList.menuMainTitle}
	                          </td>
	                          <td>
	                            ${menuList.menuState}
	                          </td>
	                          <td>
	                            ${menuList.menuCheckCount}
	                          </td>
	                          <td>
	                            ${menuList.menuPrice}
	                          </td>
	                          <td>
	                            ${menuList.menuRegDate}
	                          </td>
	                        </tr>
                        </c:forEach>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
    <link rel="stylesheet" href="/resources/css/subpages/qna/qna.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  	<script src="/resources/js/subpages/qna/qna.js" defer></script>
    <title>A TOOSOME PLACE</title>
    
    <!-- 게시글 등록 메시지 -->
    <script type="text/javascript">
    	const msg = "${msg}"
    	if(msg === "successBoard") {
    		alert("게시글이 등록되었습니다.");
    	}
    </script>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
		<!-- qna 시작 -->
        <section>
        	<div class="sub-header-container">
        		<h3>QnA</h3>
        		<!-- 상단 navigation -->
        		<div class="navigation-container">
        			<ul>
        				<li><a href="/">HOME</a></li>
        				<li><a href="/event">WHAT'S NEWS</a></li>
        				<li><a href="/qna">QnA</a></li>
        			</ul>
        		</div>
        	</div>
			<p>고객 한 분 한 분의 의견에 귀 기울이는 투썸플레이스가 되겠습니다</p>
        	<div class="search-container">
        		<select class="search-select" onchange="selectHandler(this);">
        			<option value="0">번호순</option>
        			<option value="1">작성일순</option>
        			<option value="2">조회수순</option>
        		</select>
        		<div class="search-wrapper">
        			<input id="search-input" type="search" placeholder="검색어를 입력하세요">
        			<button id="search-btn">검색</button>
        			<button onclick="location.href='/qna-enrollment'">등록</button>
        		</div>
        	</div>
        	<table summary="qna" class="qna-table">
        		<caption class="qna-cap">qna 번호,잠금여부,제목,날짜,조회수</caption>
        		<colgroup>
        			<col width="5%">
        			<col width="10%">
        			<col width="55%">
        			<col width="10%">
        			<col width="10%">
        			<col width="10%">
        		</colgroup>
        		<thead>
        			<tr>
        				<th scope="col">NO</th>
        				<th scope="col">잠금여부</th>
        				<th scope="col">제목</th>
        				<th scope="col">문의유형</th>
        				<th scope="col">날짜</th>
        				<th scope="col">조회수</th>
        			</tr>
        		</thead>
        		
        		<!-- javascript로 추가될 내용 -->
        		<tbody id="qna">
        		</tbody>
        	</table>
        	<div id="pagination"></div>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/subpages/qna/qnaDetail/qnaDetail.css">
  	<script src="/resources/js/subpages/qna/qnaDetail/qnaDetail.js" defer></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
		<!-- section start -->
        <section>
        	<div class="sub-header-container">
        		<h3>QnA</h3>
        		<nav class="navigation-container">
        			<ul>
        				<li><a href="#">HOME</a></li>
        				<li><a href="#">WHAT'S NEWS</a></li>
        				<li><a href="#">QnA</a></li>
        			</ul>
        		</nav>
        	</div>
        	<table summary="QnADetail" class="qna-table">
        		<colgroup>
        			<col width="60%">
        			<col width="20%">
        			<col width="20%">
        		</colgroup>
        		<thead></thead>
        		<tbody id="qnaDetail"></tbody>
        	</table>
        	<div class="list-btn">
        		<a href="#" onclick="location.href='/qna'">목록</a>
        	</div>
        	<h3>댓글</h3>
        	<table summary="QnAComment" class="comment-table">
        		<colgroup>
        			<col width="70%">
        			<col width="15%">
        			<col width="15%">
        		</colgroup>
        		<thead></thead>
        		<tbody id="comment"></tbody>
        	</table>
        	<h3>댓글 등록</h3>
        	<table summary="QnAComment" class="comment-table">
        		<colgroup>
        			<col width="70%">
        			<col width="15%">
        			<col width="15%">
        		</colgroup>
        		<thead>
        			<tr>
	        			<th>제목 : <input type="text" placeholder="제목을 입력하세요"></th>
        				<th><button>등록</button></th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr>
	        			<td colspan="5">
							<textarea rows="5" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 물론 법률에 의해 처벌받을 수 있습니다. 건전한 인터넷 사용을 위해 자제를 당부드립니다."></textarea>	        				
	        			</td>
        			</tr>
        		</tbody>
        	</table>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
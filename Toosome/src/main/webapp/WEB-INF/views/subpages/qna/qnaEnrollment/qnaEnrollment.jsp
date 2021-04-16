<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/subpages/qna/qnaEnrollment/qnaEnrollment.css">
  	<script src="/resources/js/subpages/qna/qnaEnrollment/qnaEnrollment.js" defer></script>
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
        	<div class="qna-info-container">
        		<div class="qna-info">
	        		<h3>고객님의 소중한 의견을 들려 주십시오. 작은 소리도 듣겠습니다.</h3>
	        		<p>투썸플레이스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다.<br>
						만족스러운 서비스였는지, 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다.<br>
						보다 나은 서비스로 보답하겠습니다.</p>
					<span>고객의 소리 운영시간 : 09:00~18:00 (연중무휴)</span>
        		</div>
        	</div>
        	<form id="qna-form" enctype="multipart/form-data" action="/qnaenrollment" method="POST" onsubmit="return enrollCheck()">
	        	<div class="qna-type-container">
	        		<span class="title">카테고리</span>
	        		<select name="qnaBoardType">
	        			<option value="1">메뉴문의</option>
	        			<option value="2">상품문의</option>
	        			<option value="3">배송문의</option>
	        			<option value="4">창업문의</option>
	        			<option value="5">기타</option>
	        		</select>
	        	</div>
	        	<div class="qna-title-container">
	        		<span class="title">제목</span>
	        		<input type="text" name="qnaBoardTitle" placeholder="제목을 입력하세요">
	        	</div>
        		<div class="qna-content-container">
        			<p class="title">내용</p>
        			<textarea name="qnaBoardContent" placeholder="내용을 입력하세요"></textarea>
        		</div>
        		<div class="qna-img-container">
        			<span class="title">이미지 첨부</span>
        			<input type="text" id="file-path" readonly>
        			<label for="input-file">업로드</label>
        			<input type="file" name="qnaBoardImageRoute" id="input-file" accept="image/*">	
        		</div>
        		<div class="qna-radio-container">
        			<span class="title">공개 범위</span>
        			<input type="radio" name="openScope" value="public" checked>공개
        			<input type="radio" name="openScope" value="private">비공개
        		</div>
        		<div class="qna-pwd-container">
        			<span class="title">비밀번호</span>
        			<input type="password" name="qnaBoardPassword" disabled>
        		</div>
        		<div class="btn-container">
        			<input type="reset" value="초기화">
        			<input type="button" value="목록" onclick="location.href='/qna'">
        			<input type="submit" value="등록" id="submit">
        		</div>
        	</form>
        </section>
		<!-- section end -->
        <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>
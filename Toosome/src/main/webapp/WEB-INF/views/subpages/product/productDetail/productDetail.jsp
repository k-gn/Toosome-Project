<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="/resources/css/subpages/product/productDetail/productDetail.css">
<script src="/resources/js/subpages/menuDetail/menuDetail.js"></script>
<script src="/resources/js/subpages/product/product.js"></script>
<title>A TOOSOME PLACE</title>
</head>

<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

		<div class="productDetail-container">
			<div class="contents">

				<img class="product-img"
					src="https://toosome.s3.ap-northeast-2.amazonaws.com/${productDetail.productImageVO.productImageRoute}/${productDetail.productImageVO.productImageName}.${productDetail.productImageVO.productImageExtention}"
					alt="">

				<ul class="star cf">
					<li><img
						src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_off.png"
						alt=""></li>
					<li>${productDetail.productSubName}</li>
				</ul>
				<p class="strong">${productDetail.productTitleName}</p>
				<p class="product-pay">
					<span class="com">${productDetail.productPrice}</span> 원
				</p>
				<p class="title-text">${productDetail.productContent}<p>
				<ul class="order-btn cf">
					<li><a href="/basket?productId=${productDetail.productId}"
						class="online">온라인 주문</a></li>
					<li><a class="basket"
						onclick="AddToCart('${productDetail.productId}')">장바구니 담기</a></li>

				</ul>

				<ul class="notice-box">
					<li>${productDetail.productPrecautionsVO.productPrecautionsContent}</li>

				</ul>

				<div class="comment-box">

					<div class="precaution">
						<h3 class="pretitle">${productDetail.productPrecautionsVO.productPrecautionsTitle}</h3>
						<ul class="precau">
							<li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName1}</span>
								<ul class="one">
									<li>${productDetail.productPrecautionsVO.productPrecautionsContent1}</li>
								</ul></li>
							<li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName2}</span>
								<ul class="one">
									<li>${productDetail.productPrecautionsVO.productPrecautionsContent2}
									</li>
								</ul></li>
							<li class="prelist"><span class="redbold">${productDetail.productPrecautionsVO.productPrecautionsContentName3}</span>
								<ul class="one">
									<li>${productDetail.productPrecautionsVO.productPrecautionsContent3}
	
									</li>
								</ul></li>
						</ul>
					</div>
					<div class="btn-group">
						<button class="prev">&lt;</button>
						<button class="list">목록</button>
						<button class="next">&gt;</button>
					</div>

					<ul class="one-comment">
						<li class="bold">COMMENT 맛있는 제품 한마디</li>
						<li class="thin">※ 게시판 성격과 맞지 않거나, 비방글은 언제든지 삭제될 수 있습니다.</li>
					</ul>

					<form action="/signin" method="post" class="form1">
						<div class="star-catch-cover">
							<div class="star-catch">
								<p class="star_img star">
									<img id="starimg5"
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png">
								</p>
								<p class="star_img">
									<img id="starimg4"
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png">
								</p>
								<p class="star_img">
									<img id="starimg3"
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png">
								</p>
								<p class="star_img">
									<img id="starimg2"
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png">
								</p>
								<p class="star_img">
									<img id="starimg1"
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png">
								</p>
							</div>

							<div class="triangle-cover">▼</div>

							<ul class="star-drop">
								<li><a href="#"><img id="starimg5" onmouseover=show(5)
										onclick=mark(5)
										src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg4" onmouseover=show(4)
										onclick=mark(4)
										src="/resources/img/subpages/product/productDetail/ico_star_4.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg3" onmouseover=show(3)
										onclick=mark(3)
										src="/resources/img/subpages/product/productDetail/ico_star_3.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg2" onmouseover=show(2)
										onclick=mark(2)
										src="/resources/img/subpages/product/productDetail/ico_star_2.png"
										alt=""></a></li>
								<li><a href="#"><img id="starimg1" onmouseover=show(1)
										onclick=mark(1)
										src="/resources/img/subpages/product/productDetail/ico_star_1.png"
										alt=""></a></li>
							</ul>
						</div>
						
						<input type="text" placeholder="제품 한마디를 등록해 주세요."> 
						<input type="submit" value="쓰기">
						
					</form>
					<form action="#" method="get" class="form2">
						<ul class="comment-end">
							<li><span class="star-fin"><img
									src="/resources/img/subpages/menuDetail/ico_star_1.png" alt=""></span>
								<span class="cocom">${reviewBoardList.reviewBoardContent}</span>
								<span class="nik">${reviewBoardList.reviewBoardWriter} </span>
								<span class="dat"><fmt:formatDate pattern="yyyy.MM.dd" value="${reviewBoardList.reviewBoardRegDate}"/></span></li>
							<li><span class="star-fin"><img src="/resources/img/subpages/menuDetail/ico_star_3.png" alt=""></span>
								<span class="cocom">${reviewBoardList.reviewBoardContent}</span> <span class="nik">Tommy.Lee**</span>
								<span class="dat">2021.04.01</span></li>
								<li><span class="star-fin"><img src="/resources/img/subpages/menuDetail/ico_star_3.png" alt=""></span>
								<span class="cocom">달달하니 좋네용용용</span> <span class="nik">Tommy.Lee**</span>
								<span class="dat">2021.04.01</span></li>
							<li><%
String bno = request.getParameter("productProductId");	
%>
<!-- 댓글 처리 추가 시작 -->

	<!-- 댓글을 입력하기 위한 작업 -->
	<div>
		<label for="content">comment</label>
		<form name="commentInsertForm">
			<div>
				<input type="hidden" name="productId" value="${productDetail.productId}" />
				<input type="text" id="content" name="content" placeholder="내용을 입력하세요."/>
				<span>
					<button type="button" name="commentInsertBtn">등록</button>
				</span>
			</div>
		</form>
	<div>
		<div class="commentList"></div>
	</div>
</div>
</li>	
						</ul>
						<!--
						<ul class="comment-end">
							<li><span class="star-fin"><img
									src="/resources/img/subpages/menuDetail/ico_star_1.png" alt=""></span>
								<span class="cocom">불량식품 맛 나요..ㅡㅡ</span> <span class="nik">admin**</span>
								<span class="dat">2021.04.02</span></li>
							<li><span class="star-fin"><img
									src="/resources/img/subpages/menuDetail/ico_star_3.png" alt=""></span>
								<span class="cocom">달달하니 좋네용용용</span> <span class="nik">Tommy.Lee**</span>
								<span class="dat">2021.04.01</span></li>
						</ul>
						 -->
					</form>
					</div>
				</div>
			</div>
		</div>

					
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js">	//jquery 사용위해 라이브러리 연결
</script>

<script>
$('[name=commentInsertBtn]').on("click",function(){	//댓글 등록 버튼 클릭시. name속성이 commentInsertBtn인 버튼을 클릭했을 때 함수 실행
	var insertData = $('[name=commentInsertForm]').serialize();	//commentInsertForm의 내용을 가져와서 insertData에 저장

commentInsert(insertData) //Insert 함수호출(아래)
});
	
var productId = ${productDetail.productId}; // 게시판 글 내용
	
//댓글 목록
function commentList() {
		$.ajax({
			url : '/list',
			//type : 'post',
			data : {'productId':productProductId},	//파라미터로 글번호(bno)를 전달한다. 해당 글번호에 대한 댓글을 모두 가져오기 위해서.
			dataType : 'json',
			contentType : 'application.x-www-form-urlencoded; charset=utf-8',
			success : function(data) {	//List 객체를 전달 받아서
				var a= '';
				$.each(data, function(key, value){	//List객체에 담겨있는 CommentVO의 수 만큼 반복수행한다.  key는 index값을 가진다.
				a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;"/>';
				a += '<div class="commentInfo' +value.reviewBoardId+'">' + '댓글번호 : ' + value.reviewBoardId+ ' / 작성자 : ' +value.reviewBoardWriter + '&nbsp;&nbsp;';
				a += '<a href="#" onclick="commentUpdateForm('+value.reviewBoardId+',\''+value.reviewBoardContent+'\');">수정</a>';
				a += '<a href="#" onclick="commentDelete('+value.reviewBoardId+');">&nbsp;&nbsp;삭제</a></div>';	//삭제버튼 클릭하면 commentDelete 호출
				a += '<div class="commentContent' +value.reviewBoardId+'"> <p> 내용: '+value.reviewBoardContent +'</p>';	//수정버튼을 누르면 형식이 바뀌는 부분
				a += '</div></div>';
				alert('key'+key+',value'+value);
				});
				//a에는 반복 수행한 결과가 들어있다.
				$(".commentList").html(a);//a 내용을 html형식으로 commentList에 삽입시킨다.
				
			},
			error:function() {
				alert("ajax 통신 실패(list)!!!");
			}
		});
	}	
			
//댓글 등록
function commentInsert(insertData) {
	$.ajax({
		url : '/productDetail/insert',
		type : 'POST',
		data : insertData,
		success : function(data) {
			if(data == 1)	{
				commentList();	// 댓글 작성 후 댓글 목록 reload
				$('[name=content]').val('');
			}
		},
		error:function(){
			alert("ajax통신 실패(insert)!!!")
		}
	});
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdateForm(reviewBoardId, reviewBoardContent) {	//cno와 content를 전달 받아서
	var a = '';
	
	a += '<div>';
	a += '<input type="text" name="reviewBoardContent_'+reviewBoardId+'"value"'+reviewBoardContent+'"/>';					// 입력 받는 양식 출력
	a += '<span><button type="button"onclick="commentUpdate('+reviewBoardId+');">수정</button></span>';// 수정버튼을 누르면 수정하기 위한 글 번호(cno)를 전달한다.
	a += '</div>';
	
	$('.commentContent'+reviewBoardId).html(a);	//comment 각각을 구분하기 위해 cno 사용. 서버로 가지 않고 새로운 내용을 해당 위치에 그대로 삽입시킨다.
}

//댓글 수정
function commentUpdate(reviewBoardId) {
	var updateContent = $('[name=content_'+reviewBoardId+']').val();	//name이 content_인 것을 찾아서 값(val)을 읽어와서 updateContent에 저장하라는 의미.
	
	$.ajax({
		url : '/productDetail/update',	//comment_update.bo 호출
		//type : 'post'
		dataType : 'json',
		data : {'reviewBoardContent' : updateContent, 'cno' : reviewBoardId},	//
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data) {
			if(data == 1) commentList(); // 댓글 수정 후 목록 출력
		},
		error:function() {
			alert("ajax통신 실패(update)!!!")
		}
	});
}

//댓글 삭제
function commentDelete(reviewBoardId) {
	$.ajax({
		url : '/productDetail/delete',	//comment_delete.bo에 cno를 전달한다.
		//type : 'post'
		data : {'cno' : reviewBoardId},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data) {
			if(data == 1) commentList(); // 댓글 삭제 후 목록 출력
		},
		error:function() {
			alert("ajax통신 실패(delete)!!!")
		}
	});
}

$(document).ready(function(){
	commentList(); //페이지 로딩시 댓글 목록 출력
});
</script>
<script>	

const coms = document.querySelectorAll('.com');
coms.forEach((com => {
    let num = +(com.innerHTML);
    com.innerHTML = num.toLocaleString('en');
}));
</script>
</body>
</html>
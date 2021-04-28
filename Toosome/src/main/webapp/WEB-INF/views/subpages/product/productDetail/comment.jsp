<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/subpages/share/product/productDetail/comment.jsp"></jsp:include>
<%	
				String bno = request.getParameter("productProductId");
			%>
			<!-- 댓글 처리 추가 시작 -->

			<!-- 댓글을 입력하기 위한 작업 -->
			<div>
				<label for="content">comment</label>
				<form name="commentInsertForm">
					<div>
						<input type="hidden" name="productId"
							value="${productDetail.productId}" /> <input type="text"
							id="content" name="content" placeholder="내용을 입력하세요." /> <span>
							<button type="button" name="commentInsertBtn">등록</button>
						</span>
					</div>
				</form>
				<div>
					<div class="commentList"></div>
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
</body>
</html>
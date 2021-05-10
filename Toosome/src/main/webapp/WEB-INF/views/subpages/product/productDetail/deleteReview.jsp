<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${reviewSelect.reviewBoardId }</h2>
<hr/>
<div>
<form name="reviewform" action="/reviewDelete2" method="get" class="form2" id="reviewLists">
        			<ul class="comment-end">
        				<input name="productId"  type="hidden" value="${reviewSelect.productId}" />
        				<input name="memberId" type="hidden" value="${id}"/>
        				<input name="reviewBoardId"  type="hidden" value="${reviewSelect.reviewBoardId}" />							        	
				        <input name="reviewBoardWriter" type="hidden" value="${auth == 'ROLE_USER' ? name : '관리자'}"/>
		        		
		        		
						<span><button type="submit">삭제</button></span>
					    <span><button type="button" class="cancle" >취소 </button></span>
						
					</ul>	
						
				</form>
</div>
<script type="text/javascript">
$(function(){
	$(".cancle").click(function(){
		var cancleurl = "productDetail?"+"productId=${reviewSelect.reviewBoardId}";
		location.href=cancleurl;
	});
});
</script>
</body>
</html>
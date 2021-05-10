<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var locked = 0;

function show(reviewBoardRating){
	if(locked)
		return;
	var i;
	var starimg;
	for(i=1; i<=reviewBoardRating; i++){
		starimg = 'starimg'+i;
		el = document.getElementById(starimg);	
	}
}

function lock(reviewBoardRating){
	show(reviewBoardRating);
	locked=1;
}
function mark(reviewBoardRating){
	lock(reviewBoardRating);
	document.cmtform.reviewBoardRating.value=reviewBoardRating;
	
}

</script>
</html>
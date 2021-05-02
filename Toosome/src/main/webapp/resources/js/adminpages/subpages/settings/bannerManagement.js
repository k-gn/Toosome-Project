let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
function delFunc(id) {

	$(document).ajaxSend(function(e, xhr, options) { 
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
    }); 
	
	if(!id) {
		alert("선택된 배너가 없습니다.");
	}else {
		$.ajax({
			type: "delete", //서버에 전송하는 HTTP요청 방식
			url: "/admin/banner/"+id , //서버 요청 URI
			headers: {
				"Content-Type": "application/json"
			}, //요청 헤더 정보
			dataType: "text", //응답받을 데이터의 형태
			success: function(res) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
				if(res === 'delSuccess') {
					alert("해당 배너를 삭제하였습니다.");
					location.href="/admin/banner-management";
				}else if(res === 'delFail') {
					alert("배너 삭제를 실패하였습니다.");
					location.href="/admin/banner-management";
				}
			}
		});
	}
}
	


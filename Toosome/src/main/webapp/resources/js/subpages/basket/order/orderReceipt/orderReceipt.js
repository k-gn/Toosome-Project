
$(function(){
	// test 데이터
	var testData = $(".data").val();
	
	// 만약에 testData가
	if ($(".post-text .one p").text() == testData) {
	// 결제완료와 같다면
	
		$(".post-text li").removeClass("colorRed");
		$(".post-text .one").addClass("colorRed");
		
	} else if ($(".post-text .two p").text() == testData) {
	// 접수완료와 같다면
	
		$(".post-text li").removeClass("colorRed");
		$(".post-text .two").addClass("colorRed");
		
	} else if ($(".post-text .three p").text() == testData) {
	// 배송준비중과 같다면
	
		$(".post-text li").removeClass("colorRed");
		$(".post-text .three").addClass("colorRed");
		
	} else if ($(".post-text .four p").text() == testData) {
	// 배송중과 같다면
	
		$(".post-text li").removeClass("colorRed");
		$(".post-text .four").addClass("colorRed");
		
	} else if ($(".post-text .five p").text() == testData) {4
	// 배송완료와 같다면
	
		$(".post-text li").removeClass("colorRed");
		$(".post-text .five").addClass("colorRed");
	}
	
	
	$(".under-btn").click(function () {
    var d = $(".under-table").css("display");

    if (d == "none") {
      $(".under-table").css("display", "table-row-group");
      $(".under-btn").html("내용감추기");
    } else {
      $(".under-table").css("display", "none");
      $(".under-btn").html("내용보기");
    }
  });
});

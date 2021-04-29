function checkSelectAll() {
  // 전체 체크박스
  const checkboxes = document.querySelectorAll('input[name="check"]');
  // 선택된 체크박스
  const checked = document.querySelectorAll('input[name="check"]:checked');
  // select all 체크박스
  const selectAll = document.querySelector('input[name="checkAll"]');

  if (checkboxes.length === checked.length) {
    selectAll.checked = true;
  } else {
    selectAll.checked = false;
  }
}

function selectAll(selectAll) {
  const checkboxes = document.getElementsByName("check");

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}


function cancelPay() {
      $.ajax({
        "type": "POST",
        "url": "/testToken",
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		success: function(result) {
			$.ajax({
        		"type": "POST",
       			"url": "/testToken?ordersId=",
				headers: {
					"Content-Type": "application/json"
				}, //요청 헤더 정보
				dataType: "text", //응답받을 데이터의 형태
				success: function(result) {
		
				}
      		});
		}
      });
    }

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
});


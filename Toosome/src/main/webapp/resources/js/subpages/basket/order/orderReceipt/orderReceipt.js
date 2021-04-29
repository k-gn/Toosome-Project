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

let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

function cancelPay(s) {
	$(document).ajaxSend(function(e, xhr, options) { 
	    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	    });
      $.ajax({
        "type": "POST",
        "url": "/createToken",
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		success: function(result) {
			if(result !== null) {
				$.ajax({
			        "type": "POST",
			        "url": "/getMerchantUid?ordersId="+s,
					headers: {
						"Content-Type": "application/json"
					}, //요청 헤더 정보
					dataType: "text", //응답받을 데이터의 형태
					success: function(uid) {
						if(uid != null ){
							$.ajax({
						        "type": "POST",
						        "url": "/cancelPayment?token="+result +"&mid="+ uid,
								headers: {
									"Content-Type": "application/json"
								}, //요청 헤더 정보
								dataType: "text", //응답받을 데이터의 형태
								success: function(ok) {
									if(ok == 1){
										$.ajax({
									        "type": "POST",
									        "url": "/ordersCancelReceipt?ordersId="+s,
											headers: {
												"Content-Type": "application/json"
											}, //요청 헤더 정보
											dataType: "text", //응답받을 데이터의 형태
											success: function(complete) {
												if(complete == 1){
													alert('환불 성공하였습니다.');
													location.href="/orderreceipt";
												}else{
													alert('데이터 삭제 실패');
												}
											}
							      		});
									}else{
										alert('환불 실패하였습니다.');
									}
								}
				      		});
						}
					}
	      		});
			}
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
		
	} else if ($(".post-text .five p").text() == testData) {
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

function viewContent(s) {
	$(document).ajaxSend(function(e, xhr, options) { 
    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
    });
	$.ajax({
		"type": "POST",
        "url": "/ordersViewContent?ordersId="+s,
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		success: function(results) {
		console.log(results);
			const tableBody = document.querySelector('#test');
			tableBody.innerHTML = '';
			let new2El = document.createElement('tr');
			new2El.classList.add('text-bold');
			let content2 = `
				<td>이미지</td>
              	<td colspan="2">상품명</td>
              	<td>수량</td>
              	<td>금액</td>
              	<td>배송상태</td>
			`;
			new2El.innerHTML = content2;
			tableBody.appendChild(new2El);
			results.forEach(result => {
				let newEl = document.createElement('tr');
				newEl.classList.add('under-tr');
				let content = `
					<td><img src="${result.ordersDetailImagePath}" alt=""></td>
		            <td colspan="2"><span class="pro-name">${result.ordersDetailName}</span></td>
		            <td><span class="pro-count">${result.ordersDetailAmount}</span></td>
		            <td><span class="pro-pay">${result.ordersDetailPrice}</span></td>
		            <td><span class="post-status">${result.ordersDetailState}</span></td>
				`;
				newEl.innerHTML = content;
				tableBody.appendChild(newEl);
			})
		},
		error: () => {
			alert('error');
		}
	});
}


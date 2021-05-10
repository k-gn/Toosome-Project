
let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

function cancelPay(s) {
	$(document).ajaxSend(function(e, xhr, options) { 
	    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	});
	$.ajax({
		"type": "POST",
        "url": "/lookPost?ordersId=" + s,
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		success: function(rs) {
			if(rs == "결제완료"){
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
			}else{
				alert('접수가 완료되면 주문 취소가 불가능합니다.');
			}
		}
	});
}


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
			const tableBody = document.querySelector(`.under-table.a${s}`);
			tableBody.innerHTML = '';
			let new2El = document.createElement('tr');
			new2El.classList.add('text-bold');
			let content2 = `
				<td>이미지</td>
              	<td colspan="2">상품명</td>
              	<td>수량</td>
              	<td>상품가격</td>
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

function lookPost(s) {
	$(document).ajaxSend(function(e, xhr, options) { 
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	});
	$.ajax({
    	"type": "POST",
    	"url": "/lookPost?ordersId=" + s,
		headers:{
              "Content-Type":"application/json"
        },
		dataType: "text",
		success: function(resul) {
			$(".data").val(resul);
			var testData = $(".data").val();
			//var testData = "기프티콘";
			// 만약에 testData가
			if ($(".post-text .one p").text() == testData) {
			// 결제완료와 같다면
			
				$(".post-text").css("display","flex");
				$(".giftcon").css("display","none");
				$(".post-text li").removeClass("colorRed");
				$(".post-text .one").addClass("colorRed");
				
			} else if ($(".post-text .two p").text() == testData) {
			// 접수완료와 같다면
			
				$(".post-text").css("display","flex");
				$(".giftcon").css("display","none");
				$(".post-text li").removeClass("colorRed");
				$(".post-text .two").addClass("colorRed");
				
			} else if ($(".post-text .three p").text() == testData) {
			// 배송준비중과 같다면
			
				$(".post-text").css("display","flex");
				$(".giftcon").css("display","none");
				$(".post-text li").removeClass("colorRed");
				$(".post-text .three").addClass("colorRed");
				
			} else if ($(".post-text .four p").text() == testData) {
			// 배송중과 같다면
			
				$(".post-text").css("display","flex");
				$(".giftcon").css("display","none");
				$(".post-text li").removeClass("colorRed");
				$(".post-text .four").addClass("colorRed");
				
			} else if ($(".post-text .five p").text() == testData) {
			// 배송완료와 같다면
			
				$(".post-text").css("display","flex");
				$(".giftcon").css("display","none");
				$(".post-text li").removeClass("colorRed");
				$(".post-text .five").addClass("colorRed");
				
			} else if ("기프티콘" == testData) {
			// 기프티콘과 같다면
			
				$(".post-text").css("display","none");
				$(".giftcon").css("display","flex");
			}
		}
	});
}


$(function(){
    $(".table-cover .under-btn").click(function () {
	    var d = $(this).next(".none").css("display");
	if (d == "none") {
		$(this).next(".none").css("display", "table");
	      $(this).html("내용 감추기");
	    } else if (d == "table") {
	      $(this).next(".none").css("display", "none");
	      $(this).html("내용보기");
	    }
	 });
});


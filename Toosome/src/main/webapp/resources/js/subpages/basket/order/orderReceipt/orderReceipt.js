
let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

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
		
	} else if ($(".post-text .five p").text() == testData) {
	// 배송완료와 같다면
	
		$(".post-text li").removeClass("colorRed");
		$(".post-text .five").addClass("colorRed");
	}
	
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
			const tableBody = document.querySelector(`.under-table.a${s}`);
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


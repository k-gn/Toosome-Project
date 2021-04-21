const coms = document.querySelectorAll(".com");
coms.forEach((com) => {
  let num = +com.innerHTML;
  com.innerHTML = num.toLocaleString("en");
});

let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

function AddToCart(pid) {
	
	$(document).ajaxSend(function(e, xhr, options) { 
   	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
 	}); 

	console.log(pid);
	const basket = {
		productId : pid
	};
	
	$.ajax({
	   url: '/addBasket',
	   type: 'post',
	   headers: {
		"Content-Type": "application/json"
	   }, 
	   dataType: "text",
	   data: JSON.stringify(basket),
	   success: function (res) {
		 if(res === "notLogin") {
			location.href="/signin?error"
	     }else if(res === "addSuccess") {
			let flag = confirm("상품을 장바구니에 등록하였습니다. 장바구니로 이동하시겠습니까?");
			if(flag) {
				location.href="/basket"
			}
		 }
	   }
    });

}
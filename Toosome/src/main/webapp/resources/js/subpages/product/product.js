$(function(){
   $(".product-container .contents .all li a").click(function(e){
      if($(this).children(".sold").length) {
         e.preventDefault();
      }
   });
});

let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) { 
  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
}); 
function AddToCart(pid) {

	const basket = {
		productId : pid
	};
	
	$.ajax({
	   url: '/basket',
	   type: 'post',
	   headers: {
		"Content-Type": "application/json"
	   }, 
	   dataType: "text",
	   data: JSON.stringify(basket),
	   success: function (res) {
	     if(res === "addSuccess") {
			let flag = confirm("상품을 장바구니에 등록하였습니다. 장바구니로 이동하시겠습니까?");
			if(flag) {
				location.href="/basket"
			}
		 }else {
			location.href="/signin?error"
		 }
	   }
    });
}


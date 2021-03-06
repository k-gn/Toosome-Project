/**
 * 
 */
let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
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
// 체크박스 풀기
function selectAll(selectAll) {
  const checkboxes = document.getElementsByName("check");

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}

// 삭제버튼 눌르면 그 행 삭제
function deleteRow(ths, bid) {

  const flag = confirm("해당 상품을 장바구니에서 삭제하시겠습니까?");
  if(flag) {
	  var ths = $(ths);
	  ths.parents("tr").remove();
	
	  $(document).ajaxSend(function(e, xhr, options) { 
	  	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	  }); 
	
	  $.ajax({
	    url: '/basket/' + bid,
	    type: 'delete',
	    headers: {
	 	 "Content-Type": "application/json"
	    }, 
	    dataType: "text",
	    success: function (res) {
		  if(res === 'success') {
			  alert("해당 상품을 장바구니에서 삭제하였습니다.");
			  location.href="/basket";
		  }
	    },
		error: () => {
			alert('통신 실패');
			window.history.go(-1);
		}
	  });
  }
}

let basketInfo = '';
function modBasket(i, bid) {

	$(document).ajaxSend(function(e, xhr, options) { 
    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
    }); 

	const amount = $("input[name=quantity" + i + "]").val();

	$.ajax({
	    url: '/basket/' + bid,
	    type: 'put',
	    headers: {
	 	 "Content-Type": "application/json"
	    }, 
	    dataType: "json",
        data: amount,
	    success: function(basketUtil) {
			basketInfo = basketUtil;
			$(".product-count").html(basketUtil.amount + "개");
			$(".product-pay").html(basketUtil.total.toLocaleString());
			$(".product-discount").html(basketUtil.discount.toLocaleString());
			$(".product-delivery").html(basketUtil.deliveryPay.toLocaleString());
			$(".product-point").html(basketUtil.point.toLocaleString());
			$(".product-total").html(basketUtil.realPayment.toLocaleString());
	    },
		error: () => {
			alert('통신 실패');
			window.history.go(-1);
		}
	 });
}

function deleteAll(all){
	var  all 
}

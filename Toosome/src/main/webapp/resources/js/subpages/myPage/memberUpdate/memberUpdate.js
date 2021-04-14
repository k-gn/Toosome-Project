/**
 * 
 */

const postSearch = document.querySelector(".post-search");
let csrfTokenValue = $("meta[name='_csrf']").attr("content");
let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

function daumPostcode() {
  new daum.Postcode({
    oncomplete: (data) => {
      // 검색 결과 클릭시 실행할 코드 작성

      let addr = ""; // 주소 변수

      // 사용자가 선택한 주소 타입에 따라 주소값을 가져옴
      if (data.userSelectedType === "R") {
        // 도로명 주소
        addr = data.roadAddress;
      } else {
        // 지번 주소
        addr = data.jibunAddress;
      }

      // 우편번호와 주소 삽입
      postcodeForm.value = data.zonecode;
      postcodeFormCheck();
      addr1Form.value = addr;
      addr1FormCheck();
      addr2Form.focus();
    },
  }).open();
}

function updateMember() {

	$(document).ajaxSend(function(e, xhr, options) { 
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
    }); 

	// 아이디
	const id = $(".signup-form.mid").val();
	// 이름
	const name = $(".signup-form.name").val();
	// 핸드폰 번호
	const phone = $(".signup-form.agency").val() + "-" + $(".signup-form.tel1").val() + "-" + $(".signup-form.tel2").val();
	// 주소
	const address = $(".signup-form.postcode").val() + "-" + $(".signup-form.addr1").val() + "-" + $(".signup-form.addr2").val();
	const member = {
		memberId: id,
		memberName: name,
		memberPhone: phone,
		memberAddress: address
	};
	
	//클라이언트에서 서버와 통신하는 ajax함수(비동기 통신) 
	$.ajax({
		type: "POST", //서버에 전송하는 HTTP요청 방식
		url: "/mypage/update", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "text", //응답받을 데이터의 형태
		data: JSON.stringify(member), //서버로 전송할 데이터
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log("통신 성공!: " + result);
			if(result === "modSuccess") {
				alert("회원정보 수정이 완료되었습니다.");
				location.href="/mypage/check/"+id;
			} else {
				alert("회원정보 수정을 실패하였습니다.");
				location.href="/mypage/check/"+id;
			}
		}, 
		error: function() {
			console.log("통신 실패!");
		} 
	});
}

postSearch.addEventListener("click", daumPostcode);
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
	// 아이디
	const email = $(".signup-form.email").val();
	// 이름
	const name = $(".signup-form.name").val();
	// 핸드폰 번호
	const phone = $(".signup-form.agency").val() + $(".signup-form.tel1").val() +  $(".signup-form.tel2").val();
	// 우편번호
	const postcode = $(".signup-form.postcode").val();
	// 주소
	const address = $(".signup-form.postcode").val() + "-" + $(".signup-form.addr1").val() + "-" + $(".signup-form.addr2").val();
	const member = {
		memberId: id,
		memberEmail: email,
		memberName: name,
		memberPhone: phone,
		memberPostcode: postcode,
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
			
			if(result === "modSuccess") {
				alert("회원정보 수정이 완료되었습니다.");
				location.href="/mypage/check/"+id;
			} else {
				alert("회원정보 수정을 실패하였습니다.");
				location.href="/mypage";
			}
		}, 
		error: function() {
			alert("통신 실패!");
		} 
	});
}

postSearch.addEventListener("click", daumPostcode);




const nameForm = document.querySelector('.signup-form.name');
const nameErr = document.querySelector('.validation.name');
const tel1Form = document.querySelector('.signup-form.tel1');
const tel2Form = document.querySelector('.signup-form.tel2');
const telErr = document.querySelector('.validation.tel');
const postcodeForm = document.querySelector('.signup-form.postcode');
const postcodeErr = document.querySelector('.validation.postcode');
const addr1Form = document.querySelector('.signup-form.addr1');
const addr1Err = document.querySelector('.validation.addr1');
const addr2Form = document.querySelector('.signup-form.addr2');
const submitBtn = document.querySelector('.signform-btn');




// 이름 유효성 검사
  const nameFormCheck = (e) => {
    e.preventDefault();
    const value = e.target.value;
    const namePattern = /[a-zA-Z가-힣]/;

    if (value === '') {
      nameForm.style.border = '2px solid red';
      nameErr.innerHTML = '이름 입력란이 비어있습니다';
      nameErr.style.display = 'block';
    } else if (!namePattern.test(value)) {
      nameForm.style.border = '2px solid red';
      nameErr.innerHTML = '';
      nameErr.innerHTML = '이름이 올바르지 않습니다';
      nameErr.style.display = 'block';
    } else {
      nameForm.style.border = '1px solid #ccc';
      nameErr.style.display = 'none';
    }
    activateSubmitBtn();
  };



// 전화번호 유효성 검사(앞)
  const tel1FormCheck = (e) => {
    e.preventDefault();
    const value = e.target.value;
    const telPattern = /^[0-9].{0,3}$/;

    if (value === '') {
      tel1Form.style.border = '2px solid red';
      telErr.innerHTML = '전화번호 입력란이 비어있습니다';
      telErr.style.display = 'block';
    } else if (!telPattern.test(value)) {
      tel1Form.style.border = '2px solid red';
      telErr.innerHTML = '';
      telErr.innerHTML = '전화번호가 올바르지 않습니다';
      telErr.style.display = 'block';
    } else {
      tel1Form.style.border = '1px solid #ccc';
      telErr.style.display = 'none';
    }
    activateSubmitBtn();
  };

  // 전화번호 유효성 검사(뒤)
  const tel2FormCheck = (e) => {
    e.preventDefault();
    const value = e.target.value;
    const telPattern = /^[0-9].{0,3}$/;

    if (value === '') {
      tel2Form.style.border = '2px solid red';
      telErr.innerHTML = '전화번호 입력란이 비어있습니다';
      telErr.style.display = 'block';
    } else if (!telPattern.test(value)) {
      tel2Form.style.border = '2px solid red';
      telErr.innerHTML = '';
      telErr.innerHTML = '전화번호가 올바르지 않습니다';
      telErr.style.display = 'block';
    } else {
      tel2Form.style.border = '1px solid #ccc';
      telErr.style.display = 'none';
    }
    activateSubmitBtn();
  };





  nameForm.addEventListener('keyup', nameFormCheck);
  nameForm.addEventListener('blur', nameFormCheck);
  tel1Form.addEventListener('keyup', tel1FormCheck);
  tel1Form.addEventListener('blur', tel1FormCheck);
  tel2Form.addEventListener('keyup', tel2FormCheck);
  tel2Form.addEventListener('blur', tel2FormCheck);

// 우편번호 유효성 검사
  const postcodeFormCheck = () => {
    const value = postcodeForm.value;
    const postcodePattern = /^[0-9].{0,4}$/;

    if (value === '') {
      postcodeForm.style.border = '2px solid red';
      postcodeErr.innerHTML = '우편번호 검색 버튼을 눌러주세요';
      postcodeErr.style.display = 'block';
    } else if (!postcodePattern.test(value)) {
      postcodeForm.style.border = '2px solid red';
      postcodeErr.innerHTML = '';
      postcodeErr.innerHTML = '우편번호가 올바르지 않습니다';
      postcodeErr.style.display = 'block';
    } else {
      postcodeForm.style.border = '1px solid #ccc';
      postcodeErr.style.display = 'none';
    }
    activateSubmitBtn();
  };


  // 주소 유효성 검사
  const addr1FormCheck = () => {
    const value = addr1Form.value;

    if (value === '') {
      addr1Form.style.border = '2px solid red';
      addr1Err.innerHTML = '주소 입력란이 비어있습니다';
      addr1Err.style.display = 'block';
    } else {
      addr1Form.style.border = '1px solid #ccc';
      addr1Err.style.display = 'none';
    }
    activateSubmitBtn();
  };


  postcodeForm.addEventListener('keyup', postcodeFormCheck);
  addr1Form.addEventListener('keyup', addr1FormCheck);


// 정보수정 버튼 활성화

  const activateSubmitBtn = () => {
    if (
      ((nameErr.style.display === 'none') || (nameErr.style.display === '')) &&
      ((telErr.style.display === 'none') || (telErr.style.display === '')) &&
      ((postcodeErr.style.display === 'none') || (postcodeErr.style.display === '')) &&
      ((addr1Err.style.display === 'none') || (addr1Err.style.display === ''))
    ) {
      submitBtn.disabled = false;
    } else if (
		nameErr.style.display === 'block' ||
        telErr.style.display === 'block' ||
        postcodeErr.style.display === 'block' ||
        addr1Err.style.display === 'block'
	) {
	  submitBtn.disabled = true;
	}
  };

window.onload = () => {
	activateSubmitBtn();
}
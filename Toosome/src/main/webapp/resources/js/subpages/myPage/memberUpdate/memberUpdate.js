/**
 * 
 */

const postSearch = document.querySelector(".post-search");

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

postSearch.addEventListener("click", daumPostcode);
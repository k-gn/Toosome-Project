const pwd1Form = document.querySelector(".signup-form.old-pwd");
const pwd1Err = document.querySelector(".validation.pwd1");
const pwd2Form = document.querySelector(".signup-form.new-pwd1");
const pwd2Err = document.querySelector(".validation.pwd2");
const pwd3Form = document.querySelector(".signup-form.new-pwd2");
const pwd3Err = document.querySelector(".validation.pwd3");
const submitBtn = document.querySelector(".signform-btn");

// 현재 비밀번호 유효성 검사
const pwd1FormCheck = (e) => {
  e.preventDefault();
  const pwd1Pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
  let value = e.target.value;

  if (value === "") {
    pwd1Form.style.border = "2px solid red";
    pwd1Err.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwd1Err.style.display = "block";
  } else if (!pwd1Pattern.test(value)) {
    pwd1Form.style.border = "2px solid red";
    pwd1Err.innerHTML = "";
    pwd1Err.innerHTML =
      "영문,숫자,특수문자를 포함한 8~16자리 비밀번호가 아닙니다";
    pwd1Err.style.display = "block";
  } else {
    pwd1Form.style.border = "1px solid #ccc";
    pwd1Err.style.display = "none";
  }
  activateSubmitBtn();
};

// 새 비밀번호 유효성 검사
const pwd2FormCheck = (e) => {
  e.preventDefault();
  const pwd2Pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
  const pwd1 = pwd1Form.value;
  let value = e.target.value;

  if (value === "") {
    pwd2Form.style.border = "2px solid red";
    pwd2Err.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwd2Err.style.display = "block";
  } else if (!pwd2Pattern.test(value)) {
    pwd2Form.style.border = "2px solid red";
    pwd2Err.innerHTML = "";
    pwd2Err.innerHTML =
      "영문,숫자,특수문자를 포함한 8~16자리 비밀번호가 아닙니다";
    pwd2Err.style.display = "block";
  } else if (value == pwd1) {
    pwd2Form.style.border = "2px solid red";
    pwd2Err.innerHTML = "";
    pwd2Err.innerHTML = "현재 비밀번호와 일치합니다.";
    pwd2Err.style.display = "block";
  } else {
    pwd2Form.style.border = "1px solid #ccc";
    pwd2Err.style.display = "none";
  }

  activateSubmitBtn();
};

// 현재 비밀번호와 새 비밀번호 유효성 검사
const pwd3FormCheck = (e) => {
  e.preventDefault();
  const pwd2 = pwd2Form.value;
  let value = e.target.value;

  if (value === "") {
    pwd3Form.style.border = "2px solid red";
    pwd3Err.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwd3Err.style.display = "block";
  } else if (value !== pwd2) {
    pwd3Form.style.border = "2px solid red";
    pwd3Err.innerHTML = "";
    pwd3Err.innerHTML = "비밀번호가 일치하지 않습니다";
    pwd3Err.style.display = "block";
  } else {
    pwd3Form.style.border = "1px solid #ccc";
    pwd3Err.style.display = "none";
  }
  activateSubmitBtn();
};

pwd1Form.addEventListener("keyup", pwd1FormCheck);
pwd1Form.addEventListener("blur", pwd1FormCheck);
pwd2Form.addEventListener("keyup", pwd2FormCheck);
pwd2Form.addEventListener("blur", pwd2FormCheck);
pwd3Form.addEventListener("keyup", pwd3FormCheck);
pwd3Form.addEventListener("blur", pwd3FormCheck);

// 비밀번호 변경 버튼 활성화

const activateSubmitBtn = () => {
  if (
    pwd1Err.style.display === "none" &&
    pwd2Err.style.display === "none" &&
    pwd3Err.style.display === "none"
  ) {
    submitBtn.disabled = false;
  }
};

window.onload = () => {
  activateSubmitBtn();
};

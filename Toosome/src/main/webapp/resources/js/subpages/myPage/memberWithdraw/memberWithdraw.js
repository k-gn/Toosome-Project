const pwdForm = document.querySelector(".signup-form.pwd");
const pwdErr = document.querySelector(".validation.pwd1");
const submitBtn = document.querySelector(".signform-btn");

// 현재 비밀번호 유효성 검사
const pwd1FormCheck = (e) => {
  e.preventDefault();
  const pwd1Pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
  let value = e.target.value;

  if (value === "") {
    pwdForm.style.border = "2px solid red";
    pwdErr.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwdErr.style.display = "block";
  } else if (!pwd1Pattern.test(value)) {
    pwdForm.style.border = "2px solid red";
    pwdErr.innerHTML = "";
    pwdErr.innerHTML =
      "영문,숫자,특수문자를 포함한 8~16자리 비밀번호가 아닙니다";
    pwdErr.style.display = "block";
  } else {
    pwdForm.style.border = "1px solid #ccc";
    pwdErr.style.display = "none";
  }
  activateSubmitBtn();
};

pwdForm.addEventListener("keyup", pwd1FormCheck);
pwdForm.addEventListener("blur", pwd1FormCheck);

// 비밀번호 변경 버튼 활성화

const activateSubmitBtn = () => {
  if (pwdErr.style.display === "none") {
    submitBtn.disabled = false;
  } else {
    submitBtn.disabled = true;
  }
};

window.onload = () => {
  activateSubmitBtn();
};

const pwd = document.querySelector("#pwd");
const newPwd = document.querySelector("#newPwd");
const newPwd2 = document.querySelector("#newPwd2");
const pwdErr = document.querySelector("#pwdErr");
const submitBtn = document.querySelector("#subBtn");

// 현재 비밀번호 유효성 검사
const pwd1FormCheck = (e) => {
  e.preventDefault();
  let value = e.target.value;

  if (value === "") {
    pwd.style.border = "2px solid red";
    pwdErr.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwdErr.style.display = "block";
  } else {
    pwd.style.border = "2px solid green";
	pwdErr.innerHTML = "";
  }
  activateSubmitBtn();
};

// 새 비밀번호 유효성 검사
const pwd2FormCheck = (e) => {
  e.preventDefault();
  const pwd2Pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
  const pwd1 = pwd.value;
  let value = e.target.value;

  if (value === "") {
    newPwd.style.border = "2px solid red";
    pwdErr.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwdErr.style.display = "block";
  } else if (!pwd2Pattern.test(value)) {
    newPwd.style.border = "2px solid red";
    pwdErr.innerHTML = "";
    pwdErr.innerHTML =
      "영문,숫자,특수문자를 포함한 8~16자리 비밀번호가 아닙니다";
    pwdErr.style.display = "block";
  } else {	
    newPwd.style.border = "2px solid green";
	pwdErr.innerHTML = "";
  }

  activateSubmitBtn();
};

// 현재 비밀번호와 새 비밀번호 유효성 검사
const pwd3FormCheck = (e) => {
  e.preventDefault();
  const pwd2 = newPwd.value;
  let value = e.target.value;

  if (value === "") {
    newPwd2.style.border = "2px solid red";
    pwdErr.innerHTML = "비밀번호 입력란이 비어있습니다";
    pwdErr.style.display = "block";
  } else if (value !== pwd2) {
    newPwd2.style.border = "2px solid red";
    pwdErr.innerHTML = "";
    pwdErr.innerHTML = "비밀번호가 일치하지 않습니다";
    pwdErr.style.display = "block";
  } else {
    newPwd2.style.border = "2px solid green";
    pwdErr.style.display = "none";
  }
  activateSubmitBtn();
};

// 비밀번호 변경 버튼 활성화

const activateSubmitBtn = () => {
  if (pwdErr.style.display === "none") {
	console.log("false");
    submitBtn.disabled = false;
  } else {
	console.log("true");
    submitBtn.disabled = true;
  }
};

// event hook
pwd.addEventListener("keyup", pwd1FormCheck);
pwd.addEventListener("blur", pwd1FormCheck);
newPwd.addEventListener("keyup", pwd2FormCheck);
newPwd.addEventListener("blur", pwd2FormCheck);
newPwd2.addEventListener("keyup", pwd3FormCheck);
newPwd2.addEventListener("blur", pwd3FormCheck);

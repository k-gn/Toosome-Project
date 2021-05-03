const soldStartCalendar = document.querySelector('#calendar3'); // 판매시작일 달력
const productBtn = document.querySelector('#productBtn'); 
// init
const calendarInit = () => {
	const today = moment().format('YYYY-MM-DD');
	soldStartCalendar.value = today;
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
});

const name1 = document.querySelector("#name1");
const name2 = document.querySelector("#name2");
const price = document.querySelector("#price");
const category = document.querySelector("#category");
const count = document.querySelector("#count");
const state = document.querySelector("#state");
const isNew = document.querySelector("#isNew");
const content = document.querySelector("#content");
const file = document.querySelector("#file");

const FormCheck = (e) => {
	
	let formObj = $("form[role='form']");
	const num_check=/^[0-9]*$/;
	e.preventDefault();
	if(name1.value === "" || name1.value.length < 2) {
		alert("상품이름값이 올바르지 않습니다.(3글자 이상)");
	}else if(name2.value === "" || name2.value.length < 2) {
		alert("상품이름(서브)값이 올바르지 않습니다.");
	}else if(price.value === "" || !num_check.test(price.value)) {
		alert("상품가격이 올바르지 않습니다.");
	}else if(category.value === "") {
		alert("카테고리가 올바르지 않습니다.");
	}else if(count.value === "" || !num_check.test(count.value)) {
		alert("재고수량이 올바르지 않습니다.");
	}else if(state.value === "") {
		alert("판매상태가 올바르지 않습니다.");
	}else if(isNew.value === "") {
		alert("신메뉴여부가 올바르지 않습니다.");
	}else if(file.value === "") {
		alert("파일을 선택해주세요.");
	}else if(content.value === "" || content.value.length < 5) {
		alert("상품 내용이 올바르지 않습니다.");
	}else {
		console.log("submit");
		formObj.submit();
	}

};

productBtn.addEventListener("click", FormCheck); 
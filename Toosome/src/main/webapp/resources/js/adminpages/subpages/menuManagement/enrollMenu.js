const soldStartCalendar = document.querySelector('#calendar3'); // 판매시작일 달력
const menuBtn = document.querySelector('#menuBtn'); 
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
const full = document.querySelector("#full");
const one = document.querySelector("#one");
const weight = document.querySelector("#weight");
const kcal = document.querySelector("#kcal");
const sugar = document.querySelector("#sugar");
const protein = document.querySelector("#protein");
const fat = document.querySelector("#fat");
const natrium = document.querySelector("#natrium");
const file = document.querySelector("#file");

const FormCheck = (e) => {

	let formObj = $("form[role='form']");
	const num_check=/^[0-9]*$/;
	e.preventDefault();
	if(name1.value === "" || name1.value.length < 2) {
		alert("메뉴이름값이 올바르지 않습니다.(3글자 이상)");
	}else if(name2.value === "" || name2.value.length < 2) {
		alert("메뉴이름(서브)값이 올바르지 않습니다.");
	}else if(price.value === "" || !num_check.test(price.value)) {
		alert("메뉴가격이 올바르지 않습니다.");
	}else if(category.value === "") {
		alert("카테고리가 올바르지 않습니다.");
	}else if(count.value === "" || !num_check.test(count.value)) {
		alert("재고수량이 올바르지 않습니다.");
	}else if(state.value === "") {
		alert("판매상태가 올바르지 않습니다.");
	}else if(isNew.value === "") {
		alert("신메뉴여부가 올바르지 않습니다.");
	}else if(full.value === "" || !num_check.test(full.value)) {
		alert("총 제공량이 올바르지 않습니다.");
	}else if(one.value === "" || !num_check.test(one.value)) {
		alert("1회 제공량이 올바르지 않습니다.");
	}else if(weight.value === "" || !num_check.test(weight.value)) {
		alert("용량이 올바르지 않습니다.");
	}else if(kcal.value === "" || !num_check.test(kcal.value)) {
		alert("열량이 올바르지 않습니다.");
	}else if(sugar.value === "" || !num_check.test(sugar.value)) {
		alert("당류가 올바르지 않습니다.");
	}else if(protein.value === "" || !num_check.test(protein.value)) {
		alert("단백질값이 올바르지 않습니다.");
	}else if(fat.value === "" || !num_check.test(fat.value)) {
		alert("포화지방율이 올바르지 않습니다.");
	}else if(natrium.value === "" || !num_check.test(natrium.value)) {
		alert("나트륨값이 올바르지 않습니다.");
	}else if(file.value === "") {
		alert("파일을 선택해주세요.");
	}else {
		formObj.submit();
	}

};

menuBtn.addEventListener("click", FormCheck);
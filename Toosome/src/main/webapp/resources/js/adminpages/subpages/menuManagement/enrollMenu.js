const enrollCalendar = document.querySelector('#calendar1'); // 메뉴등록일 달력
const enrollCalendar2 = document.querySelector('#calendar2'); // 메뉴등록일 달력2
const soldStartCalendar = document.querySelector('#calendar3'); // 판매시작일 달력
const soldStartCalendar2 = document.querySelector('#calendar4'); // 판매시작일 달력2

// init
const calendarInit = () => {
	const today = moment().format('YYYY-MM-DD');
	enrollCalendar.value = today;
	enrollCalendar2.value = today;
	soldStartCalendar.value = today;
	soldStartCalendar2.value = today;
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
}); 
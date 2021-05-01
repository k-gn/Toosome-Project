const soldStartCalendar = document.querySelector('#calendar3'); // 판매시작일 달력

// init
const calendarInit = () => {
	const today = moment().format('YYYY-MM-DD');
	soldStartCalendar.value = today;
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
}); 
const enrollCalendar = document.querySelector('#calendar1'); // 메뉴등록일 달력
const enrollCalendar2 = document.querySelector('#calendar2'); // 메뉴등록일 달력2
const soldStartCalendar = document.querySelector('#calendar3'); // 판매시작일 달력
const soldStartCalendar2 = document.querySelector('#calendar4'); // 판매시작일 달력2

// init
const calendarInit = () => {
	const today = moment().format('MM/DD/YYYY');
	enrollCalendar.value = today;
	enrollCalendar2.value = today;
	soldStartCalendar.value = today;
	soldStartCalendar2.value = today;
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	
	$('#datetimepicker1').datetimepicker({ format: 'L'});
	$('#datetimepicker2').datetimepicker({ 
		format: 'L',
		useCurrent: false
	});
	$("#datetimepicker1").on("change.datetimepicker", function (e) {
		$('#datetimepicker2').datetimepicker('minDate', e.date);
	});
	$("#datetimepicker2").on("change.datetimepicker", function (e) {
		$('#datetimepicker1').datetimepicker('maxDate', e.date);
	}); 
	
	$('#datetimepicker3').datetimepicker({ format: 'L'});
	$('#datetimepicker4').datetimepicker({ 
		format: 'L',
		useCurrent: false
	});
	$("#datetimepicker3").on("change.datetimepicker", function (e) {
		$('#datetimepicker4').datetimepicker('minDate', e.date);
	});
	$("#datetimepicker4").on("change.datetimepicker", function (e) {
		$('#datetimepicker3').datetimepicker('maxDate', e.date);
	}); 
}); 
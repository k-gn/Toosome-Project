const joinDate = document.querySelector('#joinDate'); // 회원가입일 기간선택
const joinDatePeriod = document.querySelector('#joinDatePeriod'); // 회원가입일 기간선택 버튼박스
const joinPeriods = document.querySelectorAll('.period.join'); // 회원가입일 기간 버튼들
const joinCalendar = document.querySelector('#calendar1'); //회원가입일 달력
const joinCalendar2 = document.querySelector('#calendar2'); //회원가입일 달력
const loginDate = document.querySelector('#joinDate'); // 로그인일자 기간선택
const loginDatePeriod = document.querySelector('#loginDatePeriod'); // 로그인일자 기간선택 버튼박스
const loginPeriods = document.querySelectorAll('.period.login'); // 로그인일자 기간 버튼들
const loginCalendar = document.querySelector('#calendar3'); // 로그인일자 달력
const loginCalendar2 = document.querySelector('#calendar4'); // 로그인일자 달력

// 기간선택 handler
const joinChangeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'join-use') {
		joinDatePeriod.style.display = 'inline';
	} else {
		joinDatePeriod.style.display = 'none';
	};
};

// 기간선택 handler
const logChangeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;	
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'log-use') {
		loginDatePeriod.style.display = 'inline';
	} else {
		loginDatePeriod.style.display = 'none';
	};
};

// on 클래스 제거
const removeOn = (periods) => {
	periods.forEach((period) => {
		if(period.classList.contains('on')) {
			period.classList.remove('on');			
		}
	});
};

// 날짜 계산 (moment.js)
const calcDate = (value, calendar) => {
	const [num, unit] = value.split('');
	const today = moment();
	const newDate = moment(today).subtract(num, unit).format('MM/DD/YYYY');
	calendar.value = newDate;
};

// init
const init = () => {
	const today = moment().format('MM/DD/YYYY');
	joinCalendar.value = today;
	joinCalendar2.value = today;
	loginCalendar.value = today;
	loginCalendar2.value = today;
};

// 기간 버튼 event hook
joinPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(joinPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, joinCalendar);
	});
});

// 기간 버튼 event hook
loginPeriods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(loginPeriods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, loginCalendar);
	});
});

// 기간선택 달력 Jquery
$(document).ready(() => {
	init();
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

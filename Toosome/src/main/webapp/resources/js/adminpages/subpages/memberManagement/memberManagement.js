const joinDate = document.querySelector('#joinDate'); // 회원가입일 기간선택
const joinDatePeriod = document.querySelector('#joinDatePeriod'); // 기간선택 버튼박스
const periods = document.querySelectorAll('.period'); // 기간 버튼들

// 기간선택 handler
const changeHandler = (e) => {
	const option = e.options[e.selectedIndex].value;
	// 옵션 선택이 use(기간선택)일 경우
	if(option === 'use') {
		joinDatePeriod.style.display = 'inline';
	} else {
		joinDatePeriod.style.display = 'none';
	}
}

// on 클래스 제거
const removeOn = () => {
	periods.forEach((period) => {
		if(period.classList.contains('on')) {
			period.classList.remove('on');			
		}
	});
};

// 기간 버튼 event hook
periods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn();
		period.classList.toggle('on');
	})
})
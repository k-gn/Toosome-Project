const tabs = document.querySelectorAll('[data-tab-target]'); // 탭
const contents = document.querySelectorAll('[data-tab-content]'); // 콘텐츠

// 탭 핸들러 함수
const tabHandler = (tab) => {
	/*
	서버 연결
	// 파라미터 JSON 형태로 받기
	const getParameterByJson = () => {
		const url = document.location.href;
		const qs = url.substring(url.indexOf('?') + 1).split('&');
		const result = {};
		for(let i=0; i<qs.length; i++) {
			qs[i] = qs[i].split('=');
			result[qs[i][0]] = decodeURIComponent(qs[i][1]);
		}
		return result;
	}
	 */
	
	// 눌려진 탭의 요소를 가져온다
	const target = document.querySelector(tab.dataset.tabTarget);
	// 콘텐츠 초기화
	contents.forEach(content => {
		content.classList.remove('active');
	});
	// 탭 초기화
	tabs.forEach(tab => {
		tab.classList.remove('active');
	});
	// 해당 요소 화면 출력
	target.classList.add('active');
	// 해당 탭 화면 출력
	tab.classList.add('active');
};

// event hook
tabs.forEach(tab => {
	tab.addEventListener('click', () => tabHandler(tab));
})
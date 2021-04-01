const subNavs = document.querySelectorAll('.nav-item'); // 네비 아이템
const childNavs = document.querySelectorAll('.sub-nav'); // 아코디언 아이템

// active 초기화
const navInit = () => {
	subNavs.forEach(subNav => {
		subNav.classList.remove('active');
	});
};
// 아코디언 초기화
const childInit = () => {
	childNavs.forEach(child => {
		child.classList.remove('display');
	});
};
// 네비 버튼 핸들러
const navHandler = (subNav) => {
	navInit();
	childInit();
	subNav.classList.add('active');
	subNav.childNodes[3].classList.add('display');
};
// event hook
subNavs.forEach((subNav) => {
	subNav.addEventListener('click', () => navHandler(subNav));	
});

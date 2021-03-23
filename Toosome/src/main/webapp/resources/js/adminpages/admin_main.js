const subNavs = document.querySelectorAll('.nav-item');

const subMemHandler = (subNav) => {
	subNav.childNodes[3].classList.toggle('display');
}

subNavs.forEach((subNav) => {
	subNav.addEventListener('click', () => subMemHandler(subNav), false);	
})

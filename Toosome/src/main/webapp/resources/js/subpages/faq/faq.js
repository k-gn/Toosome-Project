const faqWrappers = document.querySelectorAll('.faq-wrapper'); // 질문 목록

// 아코디언 핸들러 함수
const accordionHandler = (wrap) => {
	wrap.classList.toggle('active');
}
// event hook
faqWrappers.forEach(faqWrapper => {
	faqWrapper.addEventListener('click', () => accordionHandler(faqWrapper));
});
const pagination = document.getElementById('pagination');
const noticeBoard = document.getElementById('notice');

// 테스트 데이터
const testData = [
	{id: "1", title: "새해 연휴 투썸플레이스 매장 영업시간 변경 안내", date: "2020-03-25", count: "0"},
	{id: "2", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "3", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "4", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "5", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "6", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "7", title: "설 연휴 투썸플레이스 매장 영업시간 변경 안내", date: "2020-03-25", count: "0"},
	{id: "8", title: "추석 연휴 투썸플레이스 매장 영업시간 변경 안내", date: "2020-03-25", count: "0"},
	{id: "9", title: "성탄절 연휴 투썸플레이스 매장 영업시간 변경 안내", date: "2020-03-25", count: "0"},
	{id: "10", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "11", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "12", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "13", title: "여름 휴가 투썸플레이스 매장 영업시간 변경 안내", date: "2020-03-25", count: "0"},
	{id: "14", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "15", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "16", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "17", title: "시스템 개선 및 점검 사항", date: "2020-03-25", count: "0"},
	{id: "18", title: "연말 연휴 투썸플레이스 매장 영업시간 변경 안내", date: "2020-03-25", count: "0"},
];

let currentPage = 1; // 현재 페이지
let rows = 10; // 한 페이지에 보여줄 게시글 수

// 리스트 출력
const displayList = (items, wrapper, rowsPerPage, page) => {
	wrapper.innerHTML = ""; // 테이블 초기화
	page--;
	
	let start = rowsPerPage * page; // 시작 번호
	let end = start + rowsPerPage; // 끝 번호
	// 데이터를 rows만큼 끊어온다
	let paginatedItems = items.slice(start, end);
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < paginatedItems.length; i++) {
		let item = paginatedItems[i];
		let newItem = document.createElement('tr');
		let itemElement = `
			<tr>
				<td>${item.id}</td>
				<td class="left">${item.title}</td>
				<td>${item.date}</td>
				<td>${item.count}</td>
			</tr>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
	};
};

// 페이지네이션 세팅
const setPagination = (items, wrapper, rowsPerPage) => {
	wrapper.innerHTML = ""; // 테이블 초기화
	
	// 총 페이징 숫자
	let pageCount = Math.ceil(items.length / rowsPerPage);
	for(let i = 1; i < pageCount + 1; i++) {
		let btn = paginationBtn(i, items);
		wrapper.appendChild(btn);
	};
};

// 페이지네이션 버튼 생성 후 반환
const paginationBtn = (page, items) => {
	let btn = document.createElement('button');
	btn.innerText = page;
	// 현재 페이지에서 active 활성화
	if(currentPage == page) {
		btn.classList.add('active');
	};
	
	btn.addEventListener('click', (e) => btnHandler(e,items,page));
	return btn;
};

// 페이지네이션 버튼 핸들러
const btnHandler = (e,items,page) => {
	// 현재 페이지 이동
	currentPage = page;
	// 누른 페이지 데이터 출력
	displayList(items, noticeBoard, rows, currentPage);
	// 이전 버튼 비활성화
	let currentBtn = document.querySelector('#pagination button.active');
	currentBtn.classList.remove('active');
	// 누른 버튼 활성화
	e.target.classList.add('active');
};

// event hook
displayList(testData, noticeBoard, rows, currentPage);
setPagination(testData, pagination, rows);
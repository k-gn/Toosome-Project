const pagination = document.getElementById('pagination');
const qnaBoard = document.getElementById('qna');

// 테스트 데이터
const testData = [
	{id: "1", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "2", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "3", isLocked:false, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "4", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "5", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "6", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "7", isLocked:false, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "8", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "9", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "10", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "11", isLocked:false, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "12", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "13", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "14", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "15", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "16", isLocked:true, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "17", isLocked:false, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
	{id: "18", isLocked:false, title: "문의사항 드립니다", date: "2020-03-25", count: "0"},
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
				<td><img class="lock" src=${item.isLocked ? "/resources/img/subpages/qna/lock.png" 
				: "/resources/img/subpages/qna/unlock.png"}></td>
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
	displayList(items, qnaBoard, rows, currentPage);
	// 이전 버튼 비활성화
	let currentBtn = document.querySelector('#pagination button.active');
	currentBtn.classList.remove('active');
	// 누른 버튼 활성화
	e.target.classList.add('active');
};

// event hook
displayList(testData, qnaBoard, rows, currentPage);
setPagination(testData, pagination, rows);
/**
 * 
 */

function checkSelectAll() {
  // 전체 체크박스
  const checkboxes = document.querySelectorAll('input[name="check"]');
  // 선택된 체크박스
  const checked = document.querySelectorAll('input[name="check"]:checked');
  // select all 체크박스
  const selectAll = document.querySelector('input[name="checkAll"]');

  if (checkboxes.length === checked.length) {
    selectAll.checked = true;
  } else {
    selectAll.checked = false;
  }
}
// 체크박스 풀기
function selectAll(selectAll) {
  const checkboxes = document.getElementsByName("check");

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}

// 삭제버튼 눌르면 그 행 삭제
function deleteRow(ths) {
  var ths = $(ths);

  ths.parents("tr").remove();
}

function deleteAll(all){
	var  all 
}

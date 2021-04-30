const periods = document.querySelectorAll('.period'); // 기간 버튼들
const startDate = document.querySelector('#calendar1'); //  달력1
const endDate = document.querySelector('#calendar2'); // 달력2
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블
const selectDate = document.querySelector('#selectDate'); // 테이블

let data = {};
let rows = 10000;

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
	const newDate = moment(today).subtract(num, unit).format('YYYY-MM-DD');
	calendar.value = newDate;
};

// init
const calendarInit = () => {
	removeOn(periods);
	const today = moment().format('YYYY-MM-DD');
	const start = moment(today).subtract("1","M").format("YYYY-MM-DD");
	startDate.value = start;
	endDate.value = today;
	
	let content = `
		<small>${start}</small>
      	<small>~</small>
      	<small>${today}</small>
	`;
	selectDate.innerHTML = content;
};

// 기간 버튼 event hook
periods.forEach((period) => {
	period.addEventListener('click', (e) => {
		e.preventDefault();
		removeOn(periods);
		period.classList.toggle('on');
		let val = period.value;
		calcDate(val, startDate);
	});
});

// 리스트 출력하기
const showList = (result, wrapper) => {
	wrapper.innerHTML = ''; // 테이블 초기화
	console.log("list : ", result);
	// 검색 결과가 없을 경우
	if(result.length === 0) {
		let newItem = document.createElement('tr');
		let itemElement = `
			<td colspan="6">검색 결과가 없습니다.</td>
		`;
		newItem.innerHTML = itemElement;
		wrapper.appendChild(newItem);
		return;
	};
	// loop를 돌며 element 생성 후 삽입
	for (let i = 0; i < result.length; i++) {
		let payment = result[i].payment.toLocaleString();
		let newEl = document.createElement('tr');
		let content = `
          <td>
            ${result[i].orderId}
          </td>
          <td>
            ${result[i].memberEmail}
          </td>
          <td>
            ${result[i].orderDate}
          </td>
          <td>
            ${payment} 원
          </td>
		`;
		newEl.innerHTML = content;
		wrapper.appendChild(newEl);
	};	
};

// 페이징 처리 후 데이터 출력
const setData = (result, wrapper, rows) => {
	$('#pagination').pagination({
	    dataSource: result,
	    pageSize: rows,
	    pageNumber: 5,
	    callback: function(data, pagination) {
			showList(data, wrapper);					
	    }
	});
};

// AJAX 검색 리스트 불러오기
const getList = (data, wrapper, rows) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/slist", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: data, //서버로 전송할 데이터
		success: (result) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log(result);
			// 검색 건수 출력
			let count = `검색 결과 : ${result.length}건`;
			searchResult.innerText = count;
			const newRes = result.reverse();
			setData(newRes, wrapper, rows);		
		}, 
		error: () => {
			alert('시스템과에 문의하세요');
			//history.back();
		} 
	});
};

const getStatistics = (data) => {
	// AJAX 요청
	$.ajax({
		type: "get", //서버에 전송하는 HTTP요청 방식
		url: "/admin/state", //서버 요청 URI
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		dataType: "json", //응답받을 데이터의 형태
		data: data, //서버로 전송할 데이터
		success: (result) => { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log(result);
			$("#totalPayment").html(result.totalPayment.toLocaleString() + ' <small>원<small>');
			$("#totalSalesCount").html(result.totalSales.toLocaleString() + ' <small>건<small>');
		},
		error: () => {
			alert('시스템과에 문의하세요');
			//history.back();
		} 
	});
};

// 검색 버튼 핸들러
const submitHandler = () => {
	let startStatisticsDate = ''; // 기간선택 시작일
	let endStatisticsDate = ''; // 기간선택 종료일

	startStatisticsDate = moment(startDate.value).format('YYYY-MM-DD');
	endStatisticsDate = moment(endDate.value).format('YYYY-MM-DD');

	// JSON Data
	data = {
		startStatisticsDate,
		endStatisticsDate
	};
	
	rows = 10000;
	getStatistics(data);
	getList(data, listTable, rows);
	
	let content = `
		<small>${startDate.value}</small>
      	<small>~</small>
      	<small>${endDate.value}</small>
	`;
	selectDate.innerHTML = content;
};

submitBtn.addEventListener('click', submitHandler);

// 정렬 select 핸들러
const selectHandler = (select) => {
	// selected value
	let value = select.options[select.selectedIndex].value;
	
	// init
	rows = +value;
	getList(data, listTable, rows);
};

// 기간선택 달력 Jquery
$(document).ready(() => {
	calendarInit();
	getStatistics(data);
	getList(data, listTable, rows);
}); 

// ================================================= chart start

var seq = 0,
  delays = 80,
  durations = 500;

var seq2 = 0,
  delays2 = 80,
  durations2 = 500;

ct = {

  initDashboardPageCharts: function() {

    if ($('#salesChart').length != 0 || $('#profitChart').length != 0 || $('#caseChart').length != 0) {
      /* ----------==========     Sales Chart initialization    ==========---------- */

      dataSalesChart = {
        labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        series: [
          [12, 17, 7, 17, 23, 18, 38]
        ]
      };

      optionsSalesChart = {
        lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
        }),
        low: 0,
        high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
        chartPadding: {
          top: 0,
          right: 0,
          bottom: 0,
          left: 0
        },
      }

      var salesChart = new Chartist.Line('#salesChart', dataSalesChart, optionsSalesChart);

      ct.startAnimationForLineChart(salesChart);



      /* ----------==========     Sales Profit Chart initialization    ==========---------- */

      dataProfitChart = {
        labels: ['12p', '3p', '6p', '9p', '12p', '3a', '6a', '9a'],
        series: [
          [230, 750, 450, 300, 280, 240, 200, 190]
        ]
      };

      optionsProfitChart = {
        lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
        }),
        low: 0,
        high: 1000, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
        chartPadding: {
          top: 0,
          right: 0,
          bottom: 0,
          left: 0
        }
      }

      var profitChart = new Chartist.Line('#profitChart', dataProfitChart, optionsProfitChart);

      // start animation for the Profit Chart - Line Chart
      ct.startAnimationForLineChart(profitChart);


      /* ----------==========    Number of Case Chart initialization    ==========---------- */

      var dataCaseChart = {
        labels: ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'],
        series: [
          [542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756, 895]

        ]
      };
      var optionsCaseChart = {
        axisX: {
          showGrid: false
        },
        low: 0,
        high: 1000,
        chartPadding: {
          top: 0,
          right: 5,
          bottom: 0,
          left: 0
        }
      };
      var responsiveOptions = [
        ['screen and (max-width: 640px)', {
          seriesBarDistance: 5,
          axisX: {
            labelInterpolationFnc: function(value) {
              return value[0];
            }
          }
        }]
      ];
      var caseChart = Chartist.Bar('#caseChart', dataCaseChart, optionsCaseChart, responsiveOptions);

      //start animation for the case Chart
      ct.startAnimationForBarChart(caseChart);
    }
  },

  startAnimationForLineChart: function (chart) {
    chart.on('draw', function (data) {
      if (data.type === 'line' || data.type === 'area') {
        data.element.animate({
          d: {
            begin: 600,
            dur: 700,
            from: data.path
              .clone()
              .scale(1, 0)
              .translate(0, data.chartRect.height())
              .stringify(),
            to: data.path.clone().stringify(),
            easing: Chartist.Svg.Easing.easeOutQuint,
          },
        });
      } else if (data.type === 'point') {
        seq++;
        data.element.animate({
          opacity: {
            begin: seq * delays,
            dur: durations,
            from: 0,
            to: 1,
            easing: 'ease',
          },
        });
      }
    });

    seq = 0;
  },
  startAnimationForBarChart: function (chart) {
    chart.on('draw', function (data) {
      if (data.type === 'bar') {
        seq2++;
        data.element.animate({
          opacity: {
            begin: seq2 * delays2,
            dur: durations2,
            from: 0,
            to: 1,
            easing: 'ease',
          },
        });
      }
    });

    seq2 = 0;
  },
};

// 엑셀 다운로드
const excelDownload = (id, title) => {
	let content = `
		<html xmlns:x="urns:schemas-microsoft-com:office:excel">
			<head>
				<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">
				<xml>
					<x:ExcelWorkbook>
						<x:ExcelWorksheets>
							<x:ExcelWorksheet>
								<x:Name>Sheet</x:Name>
									<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>
							</x:ExcelWorksheet>
						</x:ExcelWorksheets>
					</x:ExcelWorkbook>
				</xml>
			</head>
			<body>
				<table border="1px">
	`;
	const exportTable = $('#' + id).clone();
	exportTable.find('input').each((index, elem) => {
		$(elem).remove();
	});
	content += exportTable.html();
	content += `
		</table></body></html>
	`;
	const data_type = 'data:application/vnd.ms-excel';
	const ua = window.navigator.userAgent;
	const msie = ua.indexOf('MSIE');
	const fileName = title + '.xls';
	
	// IE 환경에서 다운로드
	if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
		if(window.navigator.msSaveBlob) {
			const blob = new Blob([content], {
				type: "application/csv;charset=UTF-8"
			});
			navigator.msSaveBlob(blob, fileName);
		}
	} else {
		const blob2 = new Blob([content], {
			type: "application/csv;charset=UTF-8"
		});
		const filename = fileName;
		const elem = window.document.createElement('a');
		elem.href = window.URL.createObjectURL(blob2);
		elem.download = filename;
		document.body.appendChild(elem);
		elem.click();
		document.body.removeChild(elem);
	}
};

const periods = document.querySelectorAll('.period'); // 기간 버튼들
const startDate = document.querySelector('#calendar1'); //  달력1
const endDate = document.querySelector('#calendar2'); // 달력2
const searchResult = document.querySelector('#search-result'); // 검색 결과 건수
const submitBtn = document.querySelector('#search-submit'); // 검색 버튼
const listTable = document.querySelector('#list-table-tbody'); // 테이블
const selectDate = document.querySelector('#selectDate'); // 테이블

let data = {};
let rows = 10000;
let chartData = [];

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
          <td style='font-size:16px;'>
            ${i}
          </td>
          <td style='font-size:16px;'>
            ${result[i].orderDate}
          </td>
          <td style='font-size:16px;'>
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
	    pageNumber: 1,
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


// ================================================= chart start

var seq = 0,
  delays = 80,
  durations = 500;

var seq2 = 0,
  delays2 = 80,
  durations2 = 500;

ct = {

  initDashboardPageCharts: function(results) {
	let dataSalesChart = {
		labels: [],
		series: []
	};
	let dataCaseChart = {
		labels: [],
		series: []
	};
	var optionsSalesChart = {
        lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
        }),
        low: 0,
        high: 5000,
        chartPadding: {
          top: 0,
          right: 0,
          bottom: 0,
          left: 0
        },
    };
	var optionsCaseChart = {
        axisX: {
          showGrid: false
        },
        low: 0,
        high: 15,
        chartPadding: {
          top: 0,
          right: 0,
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

	let temp = [];
	let temp2 = [];
	let dates = [];
	
	results.forEach(data => {
		let day = moment(data.daily).format('MMM DD');
		temp.push(data.dailySales);
		temp2.push(data.dailyPayment);
		dates.push(day);
	});
	dataSalesChart.labels = dates;
	dataCaseChart.labels = dates;
	dataSalesChart.series.push(temp2);
	dataCaseChart.series.push(temp);
	
	// 차트 선언
	var salesChart = new Chartist.Line('#salesChart', dataSalesChart, optionsSalesChart);
	var caseChart = Chartist.Bar('#caseChart', dataCaseChart, optionsCaseChart, responsiveOptions);
	
	// 차트 그리기
	ct.startAnimationForLineChart(salesChart);
	ct.startAnimationForBarChart(caseChart);

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

// 데이터 요청 AJAX
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
			if(result.totalPayment == null) {
				result.totalPayment = 0;
			}
			if(result.totalSales == null) {
				result.totalSales = 0;
			}
			$("#totalPayment").html(result.totalPayment.toLocaleString() + ' <small>원<small>');
			$("#totalSalesCount").html(result.totalSales.toLocaleString() + ' <small>건<small>');
			chartData = [...result.dailyInfo];
			ct.initDashboardPageCharts(chartData);
		},
		error: () => {
			alert('시스템과에 문의하세요');
			//history.back();
		} 
	});
};

// 최초 실행
$(document).ready(() => {
	calendarInit();
	getStatistics(data);
	getList(data, listTable, rows);
}); 

/*// 윈도우 리사이즈시 차트 다시 그리기
$(window).resize(function () {
  // reset the seq for charts drawing animations
  seq = seq2 = 0;

  setTimeout(function () {
    ct.initDashboardPageCharts();
  }, 500);
});*/

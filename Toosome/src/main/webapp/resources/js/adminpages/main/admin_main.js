var seq = 0,
  delays = 80,
  durations = 500;

var seq2 = 0,
  delays2 = 80,
  durations2 = 500;

ct = {

  initDashboardPageCharts: function() {
	let dataWebsiteViewsChart = {
		labels: [],
		series: []
	};
	let dataDailySalesChart = {
		labels: [],
		series: []
	};
	let dataDailyOrderChart = {
		labels: [],
		series: []
	};
	var optionsDailySalesChart = {
        lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
        }),
        low: 0,
        high: 1000,
        chartPadding: {
          top: 0,
          right: 0,
          bottom: 0,
          left: 0
        },
      }
	  var optionsDailyOrderChart = {
        lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
        }),
        low: 0,
        high: 50,
        chartPadding: {
          top: 0,
          right: 0,
          bottom: 0,
          left: 0
        }
      }
	 var optionsWebsiteViewsChart = {
        axisX: {
          showGrid: false
        },
        low: 0,
        high: 50,
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
	
	 let today = moment();
	 for(let i=6; i>=0; i--) {
		let date = moment(today).subtract(i, 'days').format('MMM DD');
		dataWebsiteViewsChart.labels.push(date);
		dataDailySalesChart.labels.push(date);
		dataDailyOrderChart.labels.push(date);
	 };

	 $.ajax({
		type: "get",
		url: "/admin/getDaily",	
		headers: {
           "Content-Type": "application/json"
        },
		dataType: "json",
		success: function(results) {
			// AJAX로 얻은 데이터를 차트 데이터에 삽입
			let temp = [];
			let temp2 = [];
			let temp3 = [];
			results.dailyVisit.forEach(data => {
				temp.push(data.visit);
			});
			dataWebsiteViewsChart.series.push(temp);
			
			results.dailyOrders.forEach(data => {
				temp2.push(data.orders);
			});
			dataDailyOrderChart.series.push(temp2);
			
			results.dailySales.forEach(data => {
				temp3.push(data.sales);
			});
			dataDailySalesChart.series.push(temp3);
			
			// 차트 선언
			var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);
			var websiteViewsChart = new Chartist.Bar('#websiteViewsChart', dataWebsiteViewsChart, optionsWebsiteViewsChart, responsiveOptions);
			var dailyOrderChart = new Chartist.Line('#dailyOrderChart', dataDailyOrderChart, optionsDailyOrderChart);
			
			// 차트 그리기
			ct.startAnimationForLineChart(dailySalesChart);
			ct.startAnimationForLineChart(dailyOrderChart);
			ct.startAnimationForBarChart(websiteViewsChart);
		}
	  });
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

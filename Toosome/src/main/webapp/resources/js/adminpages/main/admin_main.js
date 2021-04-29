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
        high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
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
        high: 1000, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
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
			console.log(results);
			results.dailyVisit.forEach(data => {
				dataWebsiteViewsChart.series.push(data.visit);
			});
			results.dailyOrders.forEach(data => {
				dataDailyOrderChart.series.push(data.orders);
			});
			results.dailySales.forEach(data => {
				dataDailySalesChart.series.push(data.sales);
			});
			var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);
			var websiteViewsChart = new Chartist.Bar('#websiteViewsChart', dataWebsiteViewsChart, optionsWebsiteViewsChart, responsiveOptions);
			var dailyOrderChart = new Chartist.Line('#dailyOrderChart', dataDailyOrderChart, optionsDailyOrderChart);
			ct.startAnimationForLineChart(dailySalesChart);
			ct.startAnimationForLineChart(dailyOrderChart);
			ct.startAnimationForBarChart(websiteViewsChart);
			console.log(dataWebsiteViewsChart);
			console.log(dataDailyOrderChart);
			console.log(dataDailySalesChart);
		}
	  });

    if ($('#dailySalesChart').length != 0 || $('#completedTasksChart').length != 0 || $('#websiteViewsChart').length != 0) {
      /* ----------==========     Daily Sales Chart initialization    ==========---------- */

      

      

      



      /* ----------==========     Completed Tasks Chart initialization    ==========---------- */

      

      

      // start animation for the Completed Tasks Chart - Line Chart
      


      /* ----------==========     Emails Subscription Chart initialization    ==========---------- */

     
      
      

      //start animation for the Emails Subscription Chart
      
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

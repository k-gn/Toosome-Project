package com.web.toosome.admin.statistics.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.statistics.service.IStatisticsService;
import com.web.toosome.admin.statistics.vo.StatisticsVO;

@Controller
@RequestMapping("/admin")
public class StatisticsController {
	
	@Autowired
	private IStatisticsService service;
	
	@GetMapping("/statistics") // 통계 페이지
	public String Statistics() {
		return "adminpages/subpages/statistics/statistics";
	}
	
	@GetMapping("/slist")
	@ResponseBody
	public List<StatisticsVO> getStatisticsList(StatisticsVO data) {
		return service.getDailyOrdersList(data);
	}
	
	@GetMapping("/state")
	@ResponseBody
	public Map<String, Object> getStatistics(StatisticsVO data) {
		Map<String, Object> map = new HashMap<>();
		map.put("totalSales", service.getTotalSalesCount(data));
		map.put("totalPayment", service.getTotalPayment(data));
		map.put("dailyInfo", service.getDailyInfo(data));
		return map;
	}
}

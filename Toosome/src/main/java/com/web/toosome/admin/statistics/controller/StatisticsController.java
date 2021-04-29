package com.web.toosome.admin.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticsController {
	@GetMapping("/admin/statistics") // 통계 페이지
	public String Statistics(Model model) {
		
		return "adminpages/subpages/statistics/statistics";
	}
}

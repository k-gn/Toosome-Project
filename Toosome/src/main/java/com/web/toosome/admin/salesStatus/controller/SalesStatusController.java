package com.web.toosome.admin.salesStatus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalesStatusController {
	
	@GetMapping("/admin/best-status") // 베스트 현황
	public String BestStatus() {
		return "adminpages/subpages/salesStatus/bestStatus";
	}
}

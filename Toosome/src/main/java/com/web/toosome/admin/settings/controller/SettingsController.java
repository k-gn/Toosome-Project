package com.web.toosome.admin.settings.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SettingsController {
	
	@GetMapping("/admin/banner-management") // 배너 관리
	public String BannerManagement() {
		return "adminpages/subpages/settings/bannerManagement";
	}
	
	@GetMapping("/admin/term-management") // 약관 관리
	public String TermManagement() {
		return "adminpages/subpages/settings/termManagement";
	}
}

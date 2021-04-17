package com.web.toosome.admin.menuManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuManagement {
	
	@GetMapping("/admin/menu-list") // 메뉴 리스트
	public String MenuList() {
		return "adminpages/subpages/menuManagement/menuList";
	}
	
	@GetMapping("/admin/enroll-menu") // 메뉴 등록
	public String EnrollMenu() {
		return "adminpages/subpages/menuManagement/enrollMenu";
	}
}

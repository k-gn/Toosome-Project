package com.web.toosome.user.menu.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MenuController {
	@GetMapping("/menu")   // 이거 cafe로 변경 요망
	public String menu() {
		return "subpages/menu/menu";
	}
	
	// Menu Image & Menu Event 관련 추가
	
	// Menu Order & Menu Refund
	
}

package com.web.toosome.user.menu.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MenuController {
	@GetMapping("/menu") // 이거 cafe로 변경 요망
	public String menu() {
		return "subpages/menu/menu";
	}

	@GetMapping("/nutrient1") // 영양성분표 페이지1
	public String nutrient1() {
		return "subpages/nutrient/nutrient1";
	}

	@GetMapping("/nutrient2") // 영양성분표 페이지2
	public String nutrient2() {
		return "subpages/nutrient/nutrient2";
	}

	@GetMapping("/nutrient3") // 영양성분표 페이지3
	public String nutrient3() {
		return "subpages/nutrient/nutrient3";
	}

	@GetMapping("/nutrient4") // 영양성분표 페이지4
	public String nutrient4() {
		return "subpages/nutrient/nutrient4";
	}
	// Menu Image & Menu Event 관련 추가

	// Menu Order & Menu Refund

}

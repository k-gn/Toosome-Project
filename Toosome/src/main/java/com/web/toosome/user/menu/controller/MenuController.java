package com.web.toosome.user.menu.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MenuController {
	@GetMapping("/menu") 
	public String menu() {
		return "subpages/menu/menu";
	}

	@GetMapping("/nutrient1") 
	public String nutrient1() {
		return "subpages/nutrient/nutrient1";
	}

	@GetMapping("/nutrient2") 
	public String nutrient2() {
		return "subpages/nutrient/nutrient2";
	}

	@GetMapping("/nutrient3") 
	public String nutrient3() {
		return "subpages/nutrient/nutrient3";
	}

	@GetMapping("/nutrient4") 
	public String nutrient4() {
		return "subpages/nutrient/nutrient4";
	}
	// Menu Image & Menu Event 

	// Menu Order & Menu Refund

}

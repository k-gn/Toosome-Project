package com.web.toosome.user.menu.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MenuController {
	@GetMapping("/menu") // �̰� cafe�� ���� ���
	public String menu() {
		return "subpages/menu/menu";
	}
	
	@GetMapping("/product") // product
	public String product() {
		return "subpages/product/product";
	}

	@GetMapping("/nutrient1") // ���缺��ǥ ������1
	public String nutrient1() {
		return "subpages/nutrient/nutrient1";
	}

	@GetMapping("/nutrient2") // ���缺��ǥ ������2
	public String nutrient2() {
		return "subpages/nutrient/nutrient2";
	}

	@GetMapping("/nutrient3") // ���缺��ǥ ������3
	public String nutrient3() {
		return "subpages/nutrient/nutrient3";
	}

	@GetMapping("/nutrient4") // ���缺��ǥ ������4
	public String nutrient4() {
		return "subpages/nutrient/nutrient4";
	}
	// Menu Image & Menu Event ���� �߰�

	// Menu Order & Menu Refund

}

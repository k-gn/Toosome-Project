package com.web.toosome.user.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
	@GetMapping("/menu") // �̰� cafe�� ���� ���
	public String menu() {
		return "subpages/menu/menu";
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

	@GetMapping("/beveragedetail") // menu Detail page
	public String beverageDetail() {
		return "subpages/menu/beverageDetail/beverageDetail";
	}

	@GetMapping("/delhidetail") // menu Detail page
	public String delhiDetail() {
		return "subpages/menu/delhiDetail/delhiDetail";
	}

	@GetMapping("/dessertdetail") // menu Detail page
	public String dessertDetail() {
		return "subpages/menu/dessertDetail/dessertDetail";
	}

	@GetMapping("/newdetail") // menu Detail page
	public String newDetail() {
		return "subpages/menu/newDetail/newDetail";
	}

	@GetMapping("/wholecakedetail") // menu Detail page
	public String wholecakeDetail() {
		return "subpages/menu/wholecakeDetail/wholecakeDetail";
	}
	
	// Menu Image & Menu Event ���� �߰�

	// Menu Order & Menu Refund

}

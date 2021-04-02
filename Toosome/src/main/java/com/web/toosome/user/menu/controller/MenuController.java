package com.web.toosome.user.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
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
	


	// Menu Order & Menu Refund

}

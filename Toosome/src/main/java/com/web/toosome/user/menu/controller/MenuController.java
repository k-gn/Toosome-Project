package com.web.toosome.user.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.toosome.user.menu.service.IMenuService;
import com.web.toosome.user.menu.vo.MenuVO;

@Controller
public class MenuController {
	
	@Autowired
	private IMenuService menuService;
  
	@GetMapping("/menu-new") // 이거 cafe로 변경 요망 
	public String menuNew() {
		return "subpages/menu/menuNew";
	}
	@GetMapping("/menu-beverage")
	public String menuBeverage(MenuVO menuVO, Model model) {
		System.out.println("음료 메뉴 출력");
		List<MenuVO> menuBeverageList = menuService.getbeverageList(menuVO);
		model.addAttribute("menuBeverageList",menuBeverageList);
		System.out.println(model);
		return "subpages/menu/menuBeverage";
	}
	@GetMapping("/menu-delhi")
	public String menuDelhi() {
		return "subpages/menu/menuDelhi";
	}
	@GetMapping("/menu-dessert")
	public String menuDessert() {
		return "subpages/menu/menuDessert";
	}
	@GetMapping("/menu-wholecake")
	public String menuWholecake() {
		return "subpages/menu/menuWholecake";
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

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
	public String menuNew(MenuVO menuVO, Model model) {
		System.out.println("신메뉴 출력");
		List<MenuVO> menuNewList = menuService.getnewList(menuVO);
		model.addAttribute("menuNewList",menuNewList);
		System.out.println(model);
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
	public String menuDelhi(MenuVO menuVO, Model model) {
		System.out.println("델리 메뉴 출력");
		List<MenuVO> menuDelhiList = menuService.getdelhiList(menuVO);
		model.addAttribute("menuDelhiList",menuDelhiList);
		System.out.println(model);
		return "subpages/menu/menuDelhi";
	}
	@GetMapping("/menu-dessert")
	public String menuDessert(MenuVO menuVO, Model model) {
		System.out.println("디저트 메뉴 출력");
		List<MenuVO> menuDessertList = menuService.getdessertList(menuVO);
		model.addAttribute("menuDessertList",menuDessertList);
		System.out.println(model);
		return "subpages/menu/menuDessert";
	}
	@GetMapping("/menu-wholecake")
	public String menuWholecake(MenuVO menuVO, Model model) {
		System.out.println("홀케이크 메뉴 출력");
		List<MenuVO> menuWholecakeList = menuService.getwholecaketList(menuVO);
		model.addAttribute("menuWholecakeList",menuWholecakeList);
		System.out.println(model);
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
	
	@GetMapping("/newdetail") // menu Detail page
	public String newDetail(MenuVO menuVO, Model model) {
		System.out.println("음료 메뉴 디테일 출력");
		MenuVO menunewDetail = menuService.getnewDetail(menuVO);
		model.addAttribute("menunewDetail",menunewDetail);
		System.out.println(model);
		return "subpages/menu/newDetail/newDetail";
	}
	
	@GetMapping("/beveragedetail") // menu Detail page
	public String beverageDetail(MenuVO menuVO, Model model) {
		System.out.println("음료 메뉴 디테일 출력");
		MenuVO menubeverageDetail = menuService.getbeverageDetail(menuVO);
		model.addAttribute("menubeverageDetail",menubeverageDetail);
		System.out.println(model);
		return "subpages/menu/beverageDetail/beverageDetail";
	}

	@GetMapping("/delhidetail") // menu Detail page
	public String delhiDetail(MenuVO menuVO, Model model) {
		System.out.println("음료 메뉴 디테일 출력");
		MenuVO menubeverageDetai = menuService.getdelhiDetail(menuVO);
		model.addAttribute("menubeverageDetai",menubeverageDetai);
		System.out.println(model);
		return "subpages/menu/delhiDetail/delhiDetail";
	}

	@GetMapping("/dessertdetail") // menu Detail page
	public String dessertDetail(MenuVO menuVO, Model model) {
		System.out.println("음료 메뉴 디테일 출력");
		MenuVO menubeverageDetai = menuService.getdessertDetail(menuVO);
		model.addAttribute("menubeverageDetai",menubeverageDetai);
		System.out.println(model);
		return "subpages/menu/dessertDetail/dessertDetail";
	}

	@GetMapping("/wholecakedetail") // menu Detail page
	public String wholecakeDetail(MenuVO menuVO, Model model) {
		System.out.println("음료 메뉴 디테일 출력");
		MenuVO menubeverageDetai = menuService.getwholecakeDetail(menuVO);
		model.addAttribute("menubeverageDetai",menubeverageDetai);
		System.out.println(model);
		return "subpages/menu/wholecakeDetail/wholecakeDetail";
	}
	


	// Menu Order & Menu Refund

}

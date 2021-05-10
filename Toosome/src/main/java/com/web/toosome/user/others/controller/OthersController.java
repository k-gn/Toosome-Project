package com.web.toosome.user.others.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OthersController {
	@GetMapping("/franchise") // 창업정보 페이지	
	public String franchise() {
		return "subpages/franchise/franchise";
	}

	@GetMapping("/franchisepay") // 가맹점 전용 금융상품 페이지	
	public String franchisepay() {
		return "subpages/franchisePay/franchisePay";
	}

	@GetMapping("/explanation") // 창업 설명 페이지	
	public String explanation() {
		return "subpages/explanation/explanation";
	}

	@GetMapping("/allbuy") // 단체구매 페이지
	public String allBuy() {
		return "subpages/allBuy/allBuy";
	}

	@GetMapping("/sitemap")	// 메뉴바 Map 페이지
	public String sitemap() {
		return "subpages/siteMap/siteMap";
	}
	
	@GetMapping("/map")
	public String map() {
		return "subpages/map/map";
	}
	
	@GetMapping("/brandstory")
	public String brand() {
		return "subpages/brandstory/brandStory";
	}

	@GetMapping("/coffeestory")
	public String coffeestory() {
		return "subpages/coffeeStory/coffeeStory";
	}

	@GetMapping("/dessertstory")
	public String dessertStory() {
		return "subpages/dessertStory/dessertStory";
	}

	@GetMapping("/brandfilm1")
	public String brandFilm1() {
		return "subpages/brandFilm/brandFilm1";
	}
	@GetMapping("/brandfilm2")
	public String brandFilm2() {
		return "subpages/brandFilm/brandFilm2";
	}
	@GetMapping("/brandfilm3")
	public String brandFilm3() {
		return "subpages/brandFilm/brandFilm3";
	}
}

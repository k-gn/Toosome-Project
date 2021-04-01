package com.web.toosome.user.others.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OthersController {
	@GetMapping("/franchise")	
	public String franchise() {
		return "subpages/franchise/franchise";
	}

	@GetMapping("/franchisepay")	
	public String franchisepay() {
		return "subpages/franchisePay/franchisePay";
	}

	@GetMapping("/explanation")	
	public String explanation() {
		return "subpages/explanation/explanation";
	}

	@GetMapping("/allbuy") 
	public String allBuy() {
		return "subpages/allBuy/allBuy";
	}

	@GetMapping("/sitemap")	
	public String sitemap() {
		return "subpages/siteMap/siteMap";
	}
}

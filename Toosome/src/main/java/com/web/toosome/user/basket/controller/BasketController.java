package com.web.toosome.user.basket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BasketController {
	
	@GetMapping("/basket") // 장바구니
	public String basket() {
		return "subpages/basket/basket";
	}
	
}

package com.web.toosome.user.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	@GetMapping("/map")
	public String map() {
		return "subpages/map/map";
	}
}

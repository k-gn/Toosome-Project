package com.web.toosome.user.aboutus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutusController {
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

	@GetMapping("/brandfilm")
	public String brandFilm() {
		return "subpages/brandFilm/brandFilm";
	}

}

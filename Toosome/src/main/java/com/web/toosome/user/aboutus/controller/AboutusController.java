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

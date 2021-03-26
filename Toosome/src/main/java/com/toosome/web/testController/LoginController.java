package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/agreement")
	public String agreement() {
		return "subpages/agreement/agreement";
	}
	@GetMapping("/signin")
	public String signin() {
		return "subpages/signin/signin";
	}
	@GetMapping("/signup")
	public String signup() {
		return "subpages/signup/signup";
	}
	@GetMapping("/brandstory")
	public String brand() {
		return "subpages/brandstory/brandStory";
	}
	@GetMapping("/event")
	public String event() {
		return "subpages/event/event";
	}
}

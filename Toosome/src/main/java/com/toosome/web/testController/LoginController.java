package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/agreement")
	public String agreement() {
		return "subpages/agreement/agreement";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "subpages/signup/signup";
	}
	
}

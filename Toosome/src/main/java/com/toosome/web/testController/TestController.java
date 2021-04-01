package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/admin")
	public String admin() {
		return "adminpages/index";
	}

	@GetMapping("/testsns")
	public String testSns() {
		return "testSns";
	}
}

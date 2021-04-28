package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/testsms")
	public String testsms() {
		return "testsms";
	}
	
	@GetMapping("/testsms2")
	public String testsms2() {
		return "testsms2";
	}

}

package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/admin")
	public String admin() {
		return "adminpages/index";
	}
	
	@GetMapping("/testsms")
	public String testsms() {
		return "testsms";
	}
	
	@GetMapping("/testsms2")
	public String testsms2() {
		return "testsms2";
	}
	
	@GetMapping("/import1")  // 결제 화면...
	public String import1() {
		return "import";
	}
	
}

package com.web.toosome.admin.mainManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainManagementController {

	@GetMapping("/admin")
	public String admin() {
		return "adminpages/index";
	}
	
}

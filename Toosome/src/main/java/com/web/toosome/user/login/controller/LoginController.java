package com.web.toosome.user.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/signin")
	public String signin(String error, String logout, Model model) {
		return "subpages/signin/signin";
	}
	
	@GetMapping("/find-id")
	public String findId() { 
		return "subpages/signin/findId/findId";
	}
	
	@GetMapping("/find-pwd")
	public String findPwd() { 
		return "subpages/signin/findPwd/findPwd";
	}

}
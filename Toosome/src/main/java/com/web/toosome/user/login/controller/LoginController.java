package com.web.toosome.user.login.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
public class LoginController {
	
	@GetMapping("/signin")
	public String signin(String error, Model model) {
		System.out.println("/signup");
		if(error != null) model.addAttribute("loginFailMsg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		return "subpages/signin/signin";
	}
	
	@GetMapping("/admin/signin")
	public String adminsignin(String error, Model model) {
		System.out.println("/admin/signup");
		if(error != null) model.addAttribute("loginFailMsg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		return "adminpages/subpages/login/adminLogin";
	}
	
	@GetMapping("/find-id")
	public String findId() { 
		return "subpages/signin/findId/findId";
	}
	
	@GetMapping("/find-pwd")
	public String findPwd() { 
		return "subpages/signin/findPwd/findPwd";
	}
	
	@GetMapping("/accessErrorAdmin")
	public String accessDeniedAdmin(Authentication auth, Model model) {
		return "adminpages/subpages/login/adminLogin";
	}
	
	@GetMapping("/accessErrorMember")
	public String accessDeniedMember(Authentication auth, Model model) {
		return "subpages/signin/signin";
	}
}

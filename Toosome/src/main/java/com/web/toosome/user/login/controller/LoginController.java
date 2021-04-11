package com.web.toosome.user.login.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
	
	@GetMapping("/signin")
	public String signin() {
		return "subpages/signin/signin";
	}
	
	@GetMapping("/admin/signin")
	public String adminsignin() {
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
	
	@GetMapping("/loginFailMember")
	public String loginFailMember(RedirectAttributes ra, String error) {
		ra.addFlashAttribute("loginFailMsg", error);
		return "redirect:/signin";
	}
	
	@GetMapping("/loginFailAdmin")
	public String loginFailAdmin(RedirectAttributes ra, String error) {
		ra.addFlashAttribute("loginFailMsg", error);
		return "redirect:/admin/signin";
	}
}

package com.web.toosome.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	@GetMapping("/agreement")
	public String agreement() {
		return "subpages/agreement/agreement";
	}

	@GetMapping("/signup")
	public String signup() {
		return "subpages/signup/signup";
	}
	@GetMapping("/signupcomplete")
	public String signupComplete() {
		return "subpages/signupComplete/signupComplete";
	}
	
	// ȸ������ ����
	// ȸ������ �� ���� ���� ����
	
}
package com.web.toosome.user.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.member.service.MemberService;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
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
	
	// 회원가입 시 인증 절차 포함	
	// 회원가입 관련
	@PostMapping("/signup")
	@ResponseBody
	public String register(@RequestBody MemberVO member) {
		service.register(member);
		return "success";
	}
	
	@PostMapping("/emailDupCheck")
	@ResponseBody
	public String emailDupCheck(@RequestBody String email) {
		boolean result = service.emailDupCheck(email);
		if(result) return "OK";
		else return "NO";
	}
	
}

package com.web.toosome.user.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.member.dao.MemberDAO;
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

	// �쉶�썝媛��엯 �떆 �씤利� �젅李� �룷�븿
	// �쉶�썝媛��엯 愿��젴
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
		if (result)
			return "OK";
		else
			return "NO";
	}

	@Autowired
	MemberService memberService;
	@Autowired
	MemberDAO memberDAO;

	// 단일 문자(인증용도)
	@ResponseBody
	@RequestMapping("/sendSms")
	public String sendSms(String phoneNumber, String smsName) {
		System.out.println("1");
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberName(smsName);
		MemberVO result = memberDAO.getSMS(vo);
		System.out.println(result);
		if (result.getMemberName().equals(smsName)) {
			Random random = new Random();
			int checkNum = random.nextInt(899999) + 100000;
			String num = Integer.toString(checkNum);
			System.out.println("2");
			memberService.certifiedPhoneNumber(phoneNumber, num);
			return num;
		} else {
			return "18";
		}

	}

}

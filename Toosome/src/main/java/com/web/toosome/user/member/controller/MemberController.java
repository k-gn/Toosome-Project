package com.web.toosome.user.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	
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

	// 이메일 중복 확인
	@PostMapping("/emailDupCheck")
	@ResponseBody
	public String emailDupCheck(@RequestBody String email) {
		boolean result = service.emailDupCheck(email);
		if (result)
			return "OK";
		else
			return "NO";
	}
	
	// 아이디 찾기 인증번호 전송
	@ResponseBody
	@RequestMapping("/sendSms")
	public String sendSms(String phoneNumber, String smsName) {
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberName(smsName);
		MemberVO result = service.getSMS(vo);
		System.out.println(result);
		if (result.getMemberName().equals(smsName)) {
			Random random = new Random();
			int checkNum = random.nextInt(899999) + 100000;
			String num = Integer.toString(checkNum);
			System.out.println("2");
			service.certifiedPhoneNumber(phoneNumber, num);
			return num;
		} else {
			return "18";
		}

	}
	
	// 찾은 아이디 보여주기
	@ResponseBody
	@RequestMapping("/sendEmail")
	public String sendEmail(String phoneNumber) {
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		MemberVO result = service.getMail(vo);
		return result.getMemberEmail();
	}
	
	// 비밀번호 차기 인증번호 전송
	@ResponseBody
	@RequestMapping("/sendPassword")
	public String sendPassword(String phoneNumber, String email) {
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberName(email);
		MemberVO result = service.getMail(vo);
		System.out.println(result);
		if (result.getMemberEmail().equals(email)) {
			Random random = new Random();
			int checkNum = random.nextInt(899999) + 100000;
			String num = Integer.toString(checkNum);
			System.out.println("2");
			service.certifiedPhoneNumber(phoneNumber, num);
			return num;
		} else {
			return "18";
		}
	}
	
	// 찾은 아이디 보여주기
	@ResponseBody
	@RequestMapping("/sendRepassword")
	public String sendRepassword(String phoneNumber) {
		Random random = new Random();
		int checkNum = random.nextInt(899999) + 100000;
		String num = Integer.toString(checkNum);
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberPassword(num);
		service.getRepassword(vo);
		MemberVO result = service.getPassword(vo);
		System.out.println(result.getMemberPassword());
		return result.getMemberPassword();
	}
}

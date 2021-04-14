package com.web.toosome.user.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	
	
	@GetMapping("/signup")
	public String signup() {
		return "subpages/signup/signup";
	}

	@GetMapping("/signupcomplete")
	public String signupComplete() {
		return "subpages/signupComplete/signupComplete";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "subpages/myPage/myPage";
	}

	@GetMapping("/mypage/memberupdate")
	public String memberupdate(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("id");
		MemberVO member = service.getUserById(id);
		Map<String, String> map = new HashMap<>();
		if(member.getMemberPhone() != null && member.getMemberAddress() != null) {
			String[] phoneArr = member.getMemberPhone().split("-");
			map.put("tel1", phoneArr[0]);
			map.put("tel2", phoneArr[1]);
			map.put("tel3", phoneArr[2]);
			
			String[] addressArr = member.getMemberAddress().split("-");
			map.put("address1", addressArr[0]);
			map.put("address2", addressArr[1]);
			map.put("address3", addressArr[2]);
		}else {
			map.put("tel1", "010");
		}
		model.addAttribute("map", map);
		model.addAttribute("member", member);
		
		return "subpages/myPage/memberUpdate/memberUpdate";
	}
	
	// 회원 정보 수정 처리
	@PostMapping("/mypage/memberupdate")
	@ResponseBody
	public String memberupdate(@RequestBody MemberVO member) {
		int result = service.updateMember(member);
		if(result > 0) return "success";
		else return "fail";
	}

	@GetMapping("/membercheck")
	public String membercheck(Model model, HttpSession session) {
		
		return "subpages/myPage/memberCheck/memberCheck";
	}

	// 회원가입 시 인증 절차 포함
	// 회원가입 관련
	@PostMapping("/signup")
	@ResponseBody
	public String register(@RequestBody MemberVO member) {
		int result = service.registerMember(member);
		if(result > 0) return "success";
		else return "fail";
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
			int checkNum = random.nextInt(899999) + 100000; // 랜덤한 6자리 인증번호 생성.
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
		int checkNum = random.nextInt(899999) + 100000;  // 랜덤한 6자리 비밀번호 생성.
		String num = Integer.toString(checkNum);
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberPassword(num);
		service.getRepassword(vo);
		MemberVO result = service.getPassword(vo);
		System.out.println(result.getMemberPassword());
		return num;
	}
	
}

package com.web.toosome.user.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberUtilVO;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// 회원가입 페이지 이동
	@GetMapping("/signup")
	public String signup() {
		return "subpages/signup/signup";
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
		if (result) return "OK";
		else return "NO";
	}

	// 회원가입 완료 페이지 이동
	@GetMapping("/signupcomplete")
	public String signupComplete() {
		return "subpages/signupComplete/signupComplete";
	}

	// 마이페이지 이동
	@GetMapping("/mypage")
	public String mypage() {
		return "subpages/myPage/myPage";
	}

	// 회원정보 수정 페이지 이동
	@GetMapping("/mypage/update/{id}")
	public String memberupdate(@PathVariable Integer id, Model model, HttpSession session, RedirectAttributes ra) {
		int sid = (Integer) session.getAttribute("id");
		if(sid != id){
			ra.addFlashAttribute("msg", "Denied");
			return "redirect:/mypage";
		}
		
		MemberVO member = service.getUserById(id);
		Map<String, String> map = new HashMap<>();
		if(member.getMemberPhone() != null && member.getMemberAddress() != null) {
			String tel1 = member.getMemberPhone().substring(0, 3);
			String tel2 = member.getMemberPhone().substring(3, 7);
			String tel3 = member.getMemberPhone().substring(7);
			map.put("tel1", tel1);
			map.put("tel2", tel2);
			map.put("tel3", tel3);
			String[] addressArr = member.getMemberAddress().split("-");
			map.put("postcode", member.getMemberPostcode());
			for(int i=0; i<addressArr.length; i++) {
				map.put("address"+(i+1), addressArr[i]);
			}
		}else {
			map.put("tel1", "010");
		}
		model.addAttribute("map", map);
		model.addAttribute("member", member);
		
		return "subpages/myPage/memberUpdate/memberUpdate";
	}

	// 회원 정보 수정 처리
	@PostMapping("/mypage/update")
	@ResponseBody
	public String memberupdate(@RequestBody MemberVO member) {
		int result = service.updateMember(member);
		if(result > 0) return "modSuccess";
		else return "modFail";
	}

	// 회원정보 확인 페이지 이동
	@GetMapping("/mypage/check/{id}")
	public String membercheck(@PathVariable Integer id, Model model, HttpSession session, RedirectAttributes ra) {
		int sid = (Integer) session.getAttribute("id");
		if(sid != id){
			ra.addFlashAttribute("msg", "Denied");
			return "redirect:/mypage";
		}
		
		MemberVO member = service.getUserById(id);
		Map<String, String> map = new HashMap<>();
		if(member.getMemberPhone() != null && member.getMemberAddress() != null) {
			String tel1 = member.getMemberPhone().substring(0, 3);
			String tel2 = member.getMemberPhone().substring(3, 7);
			String tel3 = member.getMemberPhone().substring(7);
			map.put("tel1", tel1);
			map.put("tel2", tel2);
			map.put("tel3", tel3);
			String[] addressArr = member.getMemberAddress().split("-");
			map.put("postcode", member.getMemberPostcode());
			for(int i=0; i<addressArr.length; i++) {
				map.put("address"+(i+1), addressArr[i]);
			}
		}
		
		model.addAttribute("map", map);
		model.addAttribute("member", member);
		return "subpages/myPage/memberCheck/memberCheck";
	}
	
	// 비밀번호변경 이동
	@GetMapping("/mypage/passwordmodify")
	public String passwordmodify(HttpSession session, RedirectAttributes ra) {
		String platform = (String) session.getAttribute("platform");
		if(platform != null && (platform.equals("naver") || platform.equals("kakao"))) {
			ra.addFlashAttribute("msg", "notSocial");
			return "redirect:/mypage";
		}
		return "subpages/myPage/passwordModify/passwordModify";
	}
	
	// 비밀번호 변경 처리
	@PreAuthorize("principal.username == #vo.email")
	@PostMapping("/mypage/passwordmodify/{id}")
	public String passwordmodify(@PathVariable Integer id, MemberUtilVO vo, RedirectAttributes ra) {
		int result = 0;
		if(service.passwordCheck(id, vo.getPassword())) {
			result = service.changePassword(id, vo.getNewpassword());
		}
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "modSuccess");
		}else {
			ra.addFlashAttribute("msg", "modFail");
		}
		return "redirect:/mypage";
	}
	
	// 회원탈퇴 이동
	@GetMapping("/mypage/memberwithdraw")
	public String memberwithdraw(HttpSession session, RedirectAttributes ra) {
		String platform = (String) session.getAttribute("platform");
		if(platform != null && (platform.equals("naver") || platform.equals("kakao"))) {
			ra.addFlashAttribute("msg", "notSocial");
			return "redirect:/mypage";
		}
		return "subpages/myPage/memberWithdraw/memberWithdraw";
	}
	
	// 회원탈퇴 처리
	@PreAuthorize("principal.username == #vo.email")
	@PostMapping("/mypage/memberwithdraw/{id}")
	public String memberwithdraw(@PathVariable Integer id, MemberUtilVO vo, RedirectAttributes ra) {
		int result = 0;
		if(service.passwordCheck(id, vo.getPassword())) {
			result = service.deleteMember(service.getUserById(id).getMemberEmail(), id);
		}
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "delSuccess");
			return "redirect:/mypage/memberwithdraw";
		}else {
			ra.addFlashAttribute("msg", "delFail");
			return "redirect:/mypage/memberwithdraw";
		}
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
		if (result != null && result.getMemberName().equals(smsName)) {
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
	
	// 비밀번호 찾기 인증번호 전송
	@ResponseBody
	@RequestMapping("/sendPassword")
	public String sendPassword(String phoneNumber, String email) {
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberName(email);
		MemberVO result = service.getMail(vo);
		if (result != null && result.getMemberEmail().equals(email)) {
			Random random = new Random();
			int checkNum = random.nextInt(899999) + 100000; // 랜덤한 6자리 인증번호 생성.
			String num = Integer.toString(checkNum);
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
		int checkNum = random.nextInt(899999) + 100000; // 랜덤한 6자리 비밀번호 생성.
		String num = Integer.toString(checkNum);
		MemberVO vo = new MemberVO();
		vo.setMemberPhone(phoneNumber);
		vo.setMemberPassword(num);
		service.getRepassword(vo);
		MemberVO result = service.getPassword(vo);
		return num;
	}

	@ResponseBody
	@RequestMapping("/sendGift")
	public String sendGift(String phoneNumber) {
		System.out.println("/sendGift 실행");
		service.sendImage(phoneNumber);
		return "OK";
	}
	
	// 이메일 인증
		@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
		@ResponseBody
		public String emailCheck(String email) throws Exception {

			Random random = new Random();
			int checkNum = random.nextInt(899999) + 100000;

			/* 이메일 보내기 */
			String setFrom = "qkd2186@gmail.com"; // 발신자 메일
			String toMail = email; // 수신자 메일
			String title = "회원가입 인증 이메일 입니다."; // 메일 제목
			String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>" // 메일 내용
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8"); // true 사용이유 : 단순 텍스만 보낼려면 true를
																							// 사용하지 않아도 된다. html 허용의 의미
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true); // true 사용이유 : 단순 텍스만 보낼려면 true를 사용하지 않아도 된다. html 허용의 의미
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String num = Integer.toString(checkNum);

			return num;
		}

}

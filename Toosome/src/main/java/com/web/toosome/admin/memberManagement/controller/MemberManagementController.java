package com.web.toosome.admin.memberManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.memberManagement.service.IMemberManageService;
import com.web.toosome.admin.memberManagement.vo.WithdrawVO;
import com.web.toosome.user.member.vo.MemberSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class MemberManagementController {
	
	@Autowired
	private IMemberManageService service;
	
	@GetMapping("/member-management") // 회원관리 - 회원리스트
	public String memberManagement() {
		return "adminpages/subpages/memberManagement/memberManagement";
	}
	
	@GetMapping("/sleepmember-management") // 회원관리 - 휴면회원 리스트
	public String SleepMemberManagement() {
		return "adminpages/subpages/memberManagement/sleepMemberManagement";
	}
	
	@GetMapping("/outmember-management") // 회원관리 - 탈퇴회원 리스트
	public String OutMemberManagement() {
		return "adminpages/subpages/memberManagement/outMemberManagement";
	}
	
	@GetMapping("/blackmember-management") // 회원관리 - 블랙회원 리스트
	public String BlackMemberManagement() {
		return "adminpages/subpages/memberManagement/blackMemberManagement";
	}
	
	// 회원 목록 조회
	@GetMapping("/memberList")
	@ResponseBody
	public List<MemberVO> getMemberList(MemberSearchVO search) {
		return service.getMemberList(search);
	}
	
	// 탈퇴 회원 목록 조회
	@GetMapping("/outList")
	@ResponseBody
	public List<WithdrawVO> getOutList(MemberSearchVO search) {
		return service.getOutList(search);
	}
	
	// 회원 조회
	@GetMapping("/member/{id}")
	@ResponseBody
	public MemberVO getMember(@PathVariable Integer id) {
		return service.getMember(id);
	}
	
	// 탈퇴 회원 조회
	@GetMapping("/out/{id}")
	@ResponseBody
	public WithdrawVO getOutMember(@PathVariable Integer id) {
		return service.getOutMember(id);
	}
	
	// 회원정보 수정
	@PostMapping("/member") 
	public String updateMember(MemberVO member, Integer check, RedirectAttributes ra) {
		int result = service.updateMember(member);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		
		if(check == 3) 
			return "redirect:/admin/blackmember-management";
		else if(check == 2)
			return "redirect:/admin/sleepmember-management";
		else
			return "redirect:/admin/member-management";
	}
	
	// 탈퇴 회원 삭제
	@PostMapping("/delOutMember")
	public String delOutMember(String email, RedirectAttributes ra) {
		int result = service.delOutMember(email);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/outmember-management";
	}
}




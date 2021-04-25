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
	
	@GetMapping("/memberList")
	@ResponseBody
	public List<MemberVO> getMemberList(MemberSearchVO search) {
		System.out.println("search : " + search);
		return service.getMemberList(search);
	}
	
	@GetMapping("/outList")
	@ResponseBody
	public List<WithdrawVO> getOutList(MemberSearchVO search) {
		System.out.println("search : " + search);
		return service.getOutList(search);
	}
	
	@GetMapping("/member/{id}")
	@ResponseBody
	public MemberVO getMember(@PathVariable Integer id) {
		return service.getMember(id);
	}
	
	@PostMapping("/member") 
	public String updateMember(MemberVO member, RedirectAttributes ra) {
		System.out.println(member);
		int result = service.updateMember(member);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/member-management";
	}
}




package com.web.toosome.admin.memberManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.memberManagement.service.IMemberManageService;
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
}




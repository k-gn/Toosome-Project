package com.web.toosome.admin.memberManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagementController {
	@GetMapping("/admin/member-management") // 회원관리 - 회원리스트
	public String memberManagement() {
		return "adminpages/subpages/memberManagement/memberManagement";
	}
	
	@GetMapping("/admin/sleepmember-management") // 회원관리 - 휴면회원 리스트
	public String SleepMemberManagement() {
		return "adminpages/subpages/memberManagement/sleepMemberManagement";
	}
	
	@GetMapping("/admin/outmember-management") // 회원관리 - 탈퇴회원 리스트
	public String OutMemberManagement() {
		return "adminpages/subpages/memberManagement/outMemberManagement";
	}
	
	@GetMapping("/admin/blackmember-management") // 회원관리 - 블랙회원 리스트
	public String BlackMemberManagement() {
		return "adminpages/subpages/memberManagement/blackMemberManagement";
	}
}




package com.web.toosome.admin.membershipManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MembershipManagementController {
	@GetMapping("/admin/membership-management") // 멤버십관리
	public String MembershipManagement() {
		return "adminpages/subpages/membershipManagement/membershipManagement";
	}
	
	@GetMapping("/admin/membership-list") // 멤버십 리스트
	public String MembershipList() {
		return "adminpages/subpages/membershipManagement/membershipList";
	}
}

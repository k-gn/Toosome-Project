package com.web.toosome.admin.membershipManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.membershipManagement.service.IMembershipManagementService;
import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

@Controller
@RequestMapping("/admin")
public class MembershipManagementController {
	
	@Autowired
	private IMembershipManagementService service;
	
	@GetMapping("/membership-management") // 멤버십관리
	public String MembershipManagement() {
		return "adminpages/subpages/membershipManagement/membershipManagement";
	}
	
	@GetMapping("/membership-list") // 멤버십 리스트
	public String MembershipList() {
		return "adminpages/subpages/membershipManagement/membershipList";
	}
	
	@GetMapping("/membershipList")
	@ResponseBody
	public List<MembershipVO> getMembershipList(MembershipSearchVO search) {
		return service.getMembershipMember(search);
	}
	
	@GetMapping("/getLevel")
	@ResponseBody
	public LevelVO getLevel() {
		return null;
	}
}

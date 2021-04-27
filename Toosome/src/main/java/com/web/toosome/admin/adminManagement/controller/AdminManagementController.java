package com.web.toosome.admin.adminManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.adminManagement.service.IAdminManagementService;
import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminManagementController {
	
	@Autowired
	private IAdminManagementService adminService;
	
	@Autowired
	private IMemberService memberService;
	
	@GetMapping("/admin-list") // 운영자 관리
	public String AdminList() {
		return "adminpages/subpages/adminManagement/adminList";
	}
	
	@GetMapping("/admin-connectionrecord") // 운영자 접속기록 조회
	public String AdminRecord() {
		return "adminpages/subpages/adminManagement/adminRecord";
	}
	
	@GetMapping("/new") // 운영자 등록
	public String AdminNew() {
		return "adminpages/subpages/adminManagement/adminNew";
	}
	
	@GetMapping("/adminList")
	@ResponseBody
	public List<MemberVO> getAdminList(AdminSearchVO search) {
		return adminService.getAdminList(search);
	}
}

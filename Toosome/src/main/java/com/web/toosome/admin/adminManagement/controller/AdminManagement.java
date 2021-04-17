package com.web.toosome.admin.adminManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminManagement {
	@GetMapping("/admin/admin-list") // 운영자 관리
	public String AdminList() {
		return "adminpages/subpages/adminManagement/adminList";
	}
	
	@GetMapping("/admin/admin-connectionrecord") // 운영자 접속기록 조회
	public String AdminRecord() {
		return "adminpages/subpages/adminManagement/adminRecord";
	}
	
	@GetMapping("/admin/new") // 운영자 등록
	public String AdminNew() {
		return "adminpages/subpages/adminManagement/adminNew";
	}
}

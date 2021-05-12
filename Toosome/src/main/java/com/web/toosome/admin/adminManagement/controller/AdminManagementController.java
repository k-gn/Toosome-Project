package com.web.toosome.admin.adminManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.adminManagement.service.IAdminManagementService;
import com.web.toosome.admin.adminManagement.vo.AdminVO;
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
	
	@GetMapping("/new") // 운영자 등록
	public String AdminNew() {
		return "adminpages/subpages/adminManagement/adminNew";
	}
	
	@GetMapping("/adminList")
	@ResponseBody
	public List<MemberVO> getAdminList(AdminSearchVO search) {
		return adminService.getAdminList(search);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@PostMapping("/register")
	public String register(AdminVO member, RedirectAttributes ra) {
		System.out.println(member);
		boolean flag = memberService.emailDupCheck(member.getMemberEmail());
		if(!flag) {
			ra.addFlashAttribute("msg", "dupEmail");
			return "redirect:/admin/admin-list";
		}
		
		if(member.getMemberName().equals("") || member.getMemberEmail().equals("")) {
			ra.addFlashAttribute("msg", "fail");
			return "redirect:/admin/admin-list";
		}
		
		int result = memberService.registerAdmin(member);
		if(result > 0) ra.addFlashAttribute("msg", "success");
		else ra.addFlashAttribute("msg", "fail");
		return "redirect:/admin/admin-list";
	}
	
	@PostMapping("/modPw")
	public String modAdminPw(AdminVO admin, RedirectAttributes ra) {
		System.out.println(admin);
		int result = 0;
		if(adminService.passwordCheck(admin)) {
			result = adminService.changePassword(admin);
		}
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "modSuccess");
			return "redirect:/admin";
		}else {
			ra.addFlashAttribute("msg", "modFail");
			return "redirect:/admin/change-password";
		}
	}
	
	@GetMapping("/{id}") 
	@ResponseBody
	public MemberVO getAdminInfo(@PathVariable Integer id) {
		return adminService.getAdmin(id);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@PostMapping("/mod")
	public String modAdmin(AdminVO admin, RedirectAttributes ra) {
		int result = adminService.updateAdmin(admin);
		if(result > 0) {
			ra.addFlashAttribute("msg", "modSuccess");
		}else {
			ra.addFlashAttribute("msg", "modFail");
		}
		return "redirect:/admin/admin-list";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@PostMapping("/del")
	public String delAdmin(AdminVO admin, RedirectAttributes ra) {
		int result = adminService.deleteAdmin(admin);
		if(result > 0) {
			ra.addFlashAttribute("msg", "delSuccess");
		}else {
			ra.addFlashAttribute("msg", "delFail");
		}
		return "redirect:/admin/admin-list";
	}
	
}

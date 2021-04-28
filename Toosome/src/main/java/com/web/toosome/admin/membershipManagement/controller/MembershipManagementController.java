package com.web.toosome.admin.membershipManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.membershipManagement.service.IMembershipManagementService;
import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

@Controller
@RequestMapping("/admin")
public class MembershipManagementController {
	
	@Autowired
	private IMembershipManagementService service;
	
	@GetMapping("/membership-management") // 멤버십관리
	public String MembershipManagement(Model model) {
		model.addAttribute("lid", service.countLevel() + 1);
		return "adminpages/subpages/membershipManagement/membershipManagement";
	}
	
	@GetMapping("/membership-list") // 멤버십 리스트
	public String MembershipList() {
		return "adminpages/subpages/membershipManagement/membershipList";
	}
	
	@GetMapping("/membershipList")
	@ResponseBody
	public List<MembershipVO> getMembershipList(MembershipSearchVO search) {
		return service.getMembershipMemberList(search);
	}
	
	@GetMapping("/membershipMember/{id}")
	@ResponseBody
	public MembershipVO getMembershipMember(@PathVariable Integer id) {
		return service.getMembershipMember(id);
	}
	
	@PostMapping("/updateMembership")
	public String updateMembership(MembershipVO membership, RedirectAttributes ra) {
		int result = service.updateMembership(membership);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/membership-list";
	}
	
	@GetMapping("/level/{id}")
	@ResponseBody
	public LevelVO getLevel(@PathVariable Integer id) {
		return service.getLevel(id);
	}
	
	@GetMapping("/level")
	@ResponseBody
	public List<LevelVO> getLevelList() {
		return service.getLevelList();
	}
	
	@PostMapping("/addlvl")
	public String addLevel(LevelVO level, RedirectAttributes ra) {
		System.out.println("ADD : " + level);
		int result = service.insertLevel(level);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/membership-management";
	}
	
	@PostMapping("/modlvl")
	public String modLevel(LevelVO level, RedirectAttributes ra) {
		System.out.println("MOD : " + level);
		int result = service.updateLevel(level);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/membership-management";
	}
}

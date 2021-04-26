package com.web.toosome.admin.mainManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.toosome.admin.mainManagement.service.IMainService;
import com.web.toosome.admin.mainManagement.service.IVisitorService;

@Controller
@RequestMapping("/admin")
public class MainManagementController {
	
	@Autowired
	private IVisitorService visitService;

	@Autowired
	private IMainService mainService;
	
	@GetMapping("")
	public String admin(Model model) {
		model.addAttribute("visitCount", visitService.visitCount());
		model.addAttribute("regCount", mainService.getRegCount());
		
		return "adminpages/index";
	}
}

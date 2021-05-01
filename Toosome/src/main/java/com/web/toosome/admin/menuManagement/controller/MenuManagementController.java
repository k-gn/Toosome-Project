package com.web.toosome.admin.menuManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.menuManagement.service.IMenuManagementService;
import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.user.menu.vo.MenuVO;

@Controller
@RequestMapping("/admin")
public class MenuManagementController {
	
	@Autowired
	private IMenuManagementService service;
	
	@GetMapping("/menu-list") // 메뉴 리스트
	public String MenuList() {
		return "adminpages/subpages/menuManagement/menuList";
	}
	
	@GetMapping("/enroll-menu") // 메뉴 등록
	public String EnrollMenu() {
		return "adminpages/subpages/menuManagement/enrollMenu";
	}
	
	@GetMapping("/mlist")
	@ResponseBody
	public List<MenuVO> getMenuList(MenuSearchVO menu) {
		return service.getMenuList(menu);
	}
	
	@GetMapping("/menu/{id}")
	@ResponseBody
	public MenuVO getMenu(@PathVariable Integer id) {
		return service.getMenu(id);
	}
}

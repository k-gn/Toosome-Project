package com.web.toosome.admin.menuManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.menuManagement.service.IMenuManagementService;
import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.user.menu.vo.MenuImageVO;
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
	
	@PostMapping("/addMenu")
	public String addMenu(MenuVO menu, RedirectAttributes ra) {
		MenuImageVO menuImage = new MenuImageVO();
		menu.setMenuImageVO(menuImage);
		
		int result = service.addMenu(menu);
		if(result > 0) ra.addFlashAttribute("msg", "success");
		else ra.addFlashAttribute("msg", "fail");
		return "redirect:/admin/enroll-menu";
	}
	
	@PostMapping("/modMenu")
	public String modMenu(MenuVO menu, RedirectAttributes ra) {
		System.out.println("mod : " + menu);
		MenuImageVO menuImage = new MenuImageVO();
		menu.setMenuImageVO(menuImage);
		
		int result = service.modMenu(menu);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/menu-list";
	}
	
	@PostMapping("/delMenu")
	public String delMenu(MenuVO menu, RedirectAttributes ra) {
		System.out.println("del : " + menu);
		
		int result = service.delMenu(menu);
		if(result > 0) ra.addFlashAttribute("msg", "delSuccess");
		else ra.addFlashAttribute("msg", "delFail");
		return "redirect:/admin/menu-list";
	}
}

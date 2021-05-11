package com.web.toosome;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.toosome.admin.settings.service.ISettingService;
import com.web.toosome.user.menu.service.IMenuService;
import com.web.toosome.user.menu.vo.MenuVO;

@Controller
public class HomeController {
	
	@Autowired
	private ISettingService settingService;
	
	@Autowired 
	private IMenuService menuService;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("bannerList", settingService.getBannerList());
		model.addAttribute("path", "https://toosome.s3.ap-northeast-2.amazonaws.com");
		model.addAttribute("newList", menuService.getnewList(new MenuVO()));
		return "index";
	}	
}

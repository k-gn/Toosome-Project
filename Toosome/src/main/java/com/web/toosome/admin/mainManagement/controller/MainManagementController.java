package com.web.toosome.admin.mainManagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.mainManagement.service.IMainService;
import com.web.toosome.admin.mainManagement.service.IVisitorService;
import com.web.toosome.admin.mainManagement.vo.DailyVO;

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
		model.addAttribute("newNoticeList", mainService.getNewNoticeList());
		model.addAttribute("newQnaList", mainService.getNewQnaList());
		model.addAttribute("orderCount", mainService.getOrderCount());
		model.addAttribute("sales", mainService.getSales());
		model.addAttribute("manualPath", "https://toosome.s3.ap-northeast-2.amazonaws.com/download/");
		return "adminpages/index";
	}
	
	@GetMapping("/getDaily")
	@ResponseBody
	public Map<String, List<DailyVO>> getDaily() {
		Map<String, List<DailyVO>> dailyMap = new HashMap<>();
		List<DailyVO> dailyVisit = mainService.getDailyVisitInfo();
		List<DailyVO> dailySales = mainService.getDailySalesInfo();
		List<DailyVO> dailyOrders = mainService.getDailyOrderInfo();
		dailyMap.put("dailyVisit", dailyVisit);
		dailyMap.put("dailySales", dailySales);
		dailyMap.put("dailyOrders", dailyOrders);
		return dailyMap;
	}
	
	@GetMapping("/change-password") // 관리자 비밀번호 변경
	public String ChangePassword() {
		return "adminpages/subpages/login/changePassword";
	}
}

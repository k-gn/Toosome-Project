package com.web.toosome.user.basket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.basket.service.IBasketService;
import com.web.toosome.user.basket.vo.BasketUtil;
import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.membership.service.IMembershipService;
import com.web.toosome.user.membership.vo.MembershipVO;
import com.web.toosome.user.product.vo.ProductImageVO;

@Controller
public class BasketController {
	
	private final String basicImagePath = "https://toosome.s3.ap-northeast-2.amazonaws.com/";
	
	@Autowired
	private IBasketService service;
	
	@Autowired
	private IMembershipService mservice;
	
	@GetMapping("/basket") // 장바구니
	public String basket(HttpSession session, Model model, BasketUtil basketUtil) {
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		
		for(BasketVO basket : baskets) {
			ProductImageVO imageVO = basket.getProductImageVO();
			String imagePath = basicImagePath + imageVO.getProductImageRoute() + "/" + imageVO.getProductImageName() + "." + imageVO.getProductImageExtention();
			basket.setImagePath(imagePath);
		}
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		System.out.println(ms);
		if(ms != null) {
			
		}
		System.out.println(baskets);
		model.addAttribute("membership", ms);
		return "subpages/basket/basket";
	}

	@GetMapping("/basket/order") // 주문
	public String order() {
		return "subpages/basket/order/order";
	}

	@GetMapping("/basket/ordercomplete") // 주문
	public String ordercomplete() {
		return "subpages/basket/order/orderComplete/orderComplete";
	}
	
	@PostMapping("/addBasket") 
	@ResponseBody
	public String addBasket(@RequestBody BasketVO basket, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("id");
		if(memberId == null) {
			return "notLogin";
		}
		basket.setMemberId(memberId);
		System.out.println(basket);
		int result = service.addBasket(basket);
		if(result == 1) {
			return "addSuccess";
		}else {
			return "addFail";
		}
	}
}

package com.web.toosome.user.basket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.basket.service.IBasketService;
import com.web.toosome.user.basket.vo.BasketUtil;
import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.membership.service.IMembershipService;
import com.web.toosome.user.membership.vo.MembershipVO;

@Controller
public class BasketController {
	
	private final String basicImagePath = "https://toosome.s3.ap-northeast-2.amazonaws.com/";
	
	@Autowired
	private IBasketService service;
	
	@Autowired
	private IMembershipService mservice;
	
	// 장바구니 페이지 이동
	@GetMapping("/basket") // 장바구니
	public String basket(HttpSession session, Model model, BasketUtil basketUtil) {
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		if(ms != null) {
			basketUtil.utilMethod(baskets, ms, basicImagePath);
		}
		return "subpages/basket/basket";
	}

	@GetMapping("/basket/order") // 주문
	public String order() {
		return "subpages/basket/order/order";
	}

	@GetMapping("/basket/ordercomplete") // 주문완료
	public String ordercomplete() {
		return "subpages/basket/order/orderComplete/orderComplete";
	}

	@GetMapping("orderreceipt") // 주문내역
	public String orderreceipt() {
		return "subpages/basket/order/orderReceipt/orderReceipt";
	}
	
	// 장바구니 추가
	@PostMapping("/basket") 
	@ResponseBody
	public String addBasket(@RequestBody BasketVO basket, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("id");
		if(memberId == null) 
			return "notLogin";
		
		basket.setMemberId(memberId);
		int result = service.addBasket(basket);
		if(result == 1) 
			return "addSuccess";
		else 
			return "addFail";
		
	}
	
	// 장바구니 수정
	@PutMapping("/basket/{bid}")
	@ResponseBody
	public BasketUtil modBasket(@PathVariable Integer bid, @RequestBody Integer amount, HttpSession session, BasketUtil basketUtil) {
		service.setBasketAmount(amount, bid);
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		if(ms != null) {
			basketUtil.utilMethod(baskets, ms, basicImagePath);
		}
		return basketUtil;
	}
	
	// 장바구니 삭제
	@DeleteMapping("/basket/{bid}")
	@ResponseBody
	public String delBasket(@PathVariable Integer bid) {
		int result = service.delBasket(bid);
		if(result > 0) 
			return "success";
		else
			return "fail";
	}
}

package com.web.toosome.user.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;
import com.web.toosome.user.membership.service.IMembershipService;
import com.web.toosome.user.membership.vo.MembershipVO;

@Controller
public class BasketController {
	
	private final String basicImagePath = "https://toosome.s3.ap-northeast-2.amazonaws.com/";
	
	@Autowired
	private IBasketService service;
	
	@Autowired
	private IMembershipService mservice;
	
	@Autowired
	private IMemberService memberService;
	
	// 장바구니 페이지 이동
	@GetMapping("/basket") // 장바구니
	public String basket(HttpSession session, Model model, BasketUtil basketUtil) {
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		return "subpages/basket/basket";
	}

	@GetMapping("/basket/order") // 주문
	public String order(HttpSession session, BasketUtil basketUtil, Model model) {
		System.out.println("상품 구매 페이지 출력");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		MemberVO memberList = memberService.getUserById(memberId);
		Map<String, String> map = new HashMap<>();
		if(memberList.getMemberPhone() != null && memberList.getMemberAddress() != null) {
			// 01040178803
			String tel1 = memberList.getMemberPhone().substring(0, 3);
			String tel2 = memberList.getMemberPhone().substring(3, 7);
			String tel3 = memberList.getMemberPhone().substring(7);
			map.put("tel1", tel1);
			map.put("tel2", tel2);
			map.put("tel3", tel3);
			String[] addressArr = memberList.getMemberAddress().split("-");
			map.put("postcode", memberList.getMemberPostcode());
			for(int i=0; i<addressArr.length; i++) {
				map.put("address"+(i+1), addressArr[i]);
			}
		}else {
			map.put("tel1", "010");
		}
		model.addAttribute("map", map);
		model.addAttribute("memberList", memberList);
		MembershipVO memberPoint = mservice.getMembershipInfo(memberId);
		model.addAttribute("memberPoint", memberPoint);
		// double realPayment = basketUtil.getRealPayment();	// 할인전 금액
		
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
		basketUtil.utilMethod(baskets, ms, basicImagePath);
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
	
	@PostMapping("/basket/order") 
	@ResponseBody
	public String orderBasket(@RequestBody BasketUtil basketUtil, HttpSession session) {
		return null;
	}
	
	@GetMapping("/import2") // 결제 화면...
	public String import1(BasketVO basket, Model model, HttpSession session, Integer basketEndPrice, Integer basketsal) {
		System.out.println("상품 결제화면 호출");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		System.out.println(baskets);
		MemberVO memberImportList = memberService.getUserById(memberId);
		model.addAttribute("memberImportList", memberImportList);
		model.addAttribute("basketEndPrice", basketEndPrice);
		model.addAttribute("basketsal", basketsal);
		return "import2";
	}
	
	@ResponseBody
	@GetMapping("/productStactpoint")
	public String productStactpoint(BasketUtil basketUtil, HttpSession session, Integer basketEndPrice, Integer basketsal) {
		System.out.println("상품 결제 후 포인트 적립");
		Integer id = (Integer) session.getAttribute("id");
		double basketPrice = basketUtil.getTotal();
		double imsipoint = basketPrice * 0.01;			// 적립 포인트
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		map.put("imsipoint", (int)imsipoint);
		System.out.println((int)imsipoint);
		mservice.getStackPoint(map);
		System.out.println("getStackPoint 실행 완료");
		Integer usedPoint = basketsal - basketEndPrice;
		System.out.println(usedPoint);
		map.put("usedPoint", usedPoint);
		mservice.getDownPoint(map);
		System.out.println("getDownPoint 실행 완료");
		return "OK";
	}
	
	@GetMapping("/orderComplete")
	public String menuordercomplete(BasketUtil basketUtil, Model model, HttpSession session) {
		System.out.println("상품 결제 완료 페이지 호출");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		
		return "subpages/basket/order/orderComplete/orderComplete";
	}
}

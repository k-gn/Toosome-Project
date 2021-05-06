package com.web.toosome.admin.orderManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.orderManagement.service.OrderManagementService;
import com.web.toosome.admin.orderManagement.vo.OrderCancelManagementVO;
import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersCancelDetailVO;
import com.web.toosome.user.basket.vo.OrdersCancelVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;

@Controller
public class OrderManagementController {
	@Autowired
	private OrderManagementService orderService;
	
	@GetMapping("/admin/order-totallist") // 주문 통합 리스트
	public String OrderTotalList() {
		return "adminpages/subpages/orderManagement/orderTotalList";
	}
	
	@GetMapping("/admin/order-cancellist") // 주문 취소 리스트
	public String OrderCancelList() {
		return "adminpages/subpages/orderManagement/orderCancelList";
	}
	
	@GetMapping("/admin/orderList")
	@ResponseBody
	public List<OrdersVO> getorderList(OrderManagementVO odVO) {
		System.out.println("getorderList 메서드 실행");
		return orderService.getOrderList(odVO);
	}
	
	@GetMapping("/admin/order/{id}")
	@ResponseBody
	public OrdersVO getorderDetail(@PathVariable Integer id) {
		System.out.println("getorderDetail 메서드 실행");
		return orderService.getorderDetail(id);
	}
	
	@GetMapping("/admin/orderDetail/{id}")
	@ResponseBody
	public List<OrdersDetailVO> getorderDetailList(@PathVariable Integer id) {
		System.out.println("getorderDetailList 메서드 실행");
		List<OrdersDetailVO> ordersDetailList = orderService.getorderDetailListTwo(id); 
		return ordersDetailList;
	}
	
	@PostMapping("/admin/orders")
	public String updateOrders(OrdersVO orderVO) {
		System.out.println("updateOrders 메서드 실행");
		int result = orderService.updateOrders(orderVO);
		if(result > 0) {
			return "redirect:/admin/order-totallist";
		}else {
			return "redirect:/admin";
		}
	}
	
	@GetMapping("/admin/orderCancelList")
	@ResponseBody
	public List<OrdersCancelVO> getorderCancelList(OrderCancelManagementVO odVO) {
		System.out.println("getorderCancelList 메서드 실행");
		List<OrdersCancelVO> aaa = orderService.getOrderCancelList(odVO);
		System.out.println(aaa);
		return orderService.getOrderCancelList(odVO);
	}
	
	@GetMapping("/admin/orderCancel/{id}")
	@ResponseBody
	public OrdersCancelVO getorderCancelDetail(@PathVariable Integer id) {
		System.out.println("getorderCancelDetail 메서드 실행");
		return orderService.getorderCancelDetail(id);
	}
	
	@GetMapping("/admin/orderCancelDetail/{id}")
	@ResponseBody
	public List<OrdersCancelDetailVO> getorderCancelDetailList(@PathVariable Integer id) {
		System.out.println("getorderCancelDetailList 메서드 실행");
		List<OrdersCancelDetailVO> getorderCancelDetailList = orderService.getorderCancelDetailList(id); 
		System.out.println(getorderCancelDetailList);
		return getorderCancelDetailList;
	}
	
}

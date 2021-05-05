package com.web.toosome.admin.orderManagement.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.orderManagement.service.OrderManagementService;
import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
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
	
	@GetMapping("/admin/order-finishlist") // 주문 결제완료 리스트
	public String OrderFinishList() {
		return "adminpages/subpages/orderManagement/orderFinishList";
	}
	
	@GetMapping("/admin/order-product-readylist") // 주문 접수완료 리스트
	public String OrderProductReadyList() {
		return "adminpages/subpages/orderManagement/orderProductReadyList";
	}
	
	@GetMapping("/admin/order-delivery-readylist") // 주문 배송준비중 리스트
	public String OrderDeliveryReadyList() {
		return "adminpages/subpages/orderManagement/orderDeliveryReadyList";
	}
	
	@GetMapping("/admin/order-delivery-inglist") // 주문 배송중 리스트
	public String OrderDeliveryIngList() {
		return "adminpages/subpages/orderManagement/orderDeliveryIngList";
	}
	
	@GetMapping("/admin/order-delivery-finishlist") // 주문 배송완료 리스트
	public String OrderDeliveryFinishList() {
		return "adminpages/subpages/orderManagement/orderDeliveryFinishList";
	}
	
	@GetMapping("/admin/order-confirm-finishlist") // 주문 기프티콘 리스트
	public String OrderConfirmFinishList() {
		return "adminpages/subpages/orderManagement/orderConfirmFinishList";
	}
	
	@GetMapping("/admin/order-cancellist") // 주문 취소 리스트
	public String OrderCancelList() {
		return "adminpages/subpages/orderManagement/orderCancelList";
	}
	
	@GetMapping("/admin/orderList")
	@ResponseBody
	public List<OrdersVO> getorderList(OrderManagementVO odVO) {
		System.out.println("getorderList 메서드 실행");
		List<OrdersVO> aaa = orderService.getOrderList(odVO);
		System.out.println(aaa);
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
	@ResponseBody
	public String updateOrders(OrdersVO orderVO) {
		System.out.println("updateOrders 메서드 실행");
		int result = orderService.updateOrders(orderVO);
		if(result > 0) {
			return "redirect:/admin/order-totallist";
		}else {
			return "redirect:/admin";
		}
	}
	
	@GetMapping("/admin/orders/checkBox")
	@ResponseBody
	public List<OrdersVO> getcheckOrders(@RequestParam(value = "orderState[]") ArrayList<String> orderState){
		System.out.println("getcheckOrders 메서드 실행");
		System.out.println(orderState);
		List<OrdersVO> getcheckOrders = orderService.checkOrders(orderState);
		System.out.println("1");
		System.out.println(getcheckOrders);
		return getcheckOrders;
	}
}

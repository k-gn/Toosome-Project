package com.web.toosome.admin.orderManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderManagement {
	
	@GetMapping("/admin/order-totallist") // 주문 통합 리스트
	public String OrderTotalList() {
		return "adminpages/subpages/orderManagement/orderTotalList";
	}
	
	@GetMapping("/admin/order-depositlist") // 주문 입금대기 리스트
	public String OrderDepositList() {
		return "adminpages/subpages/orderManagement/orderDepositList";
	}
	
	@GetMapping("/admin/order-finishlist") // 주문 결제완료 리스트
	public String OrderFinishList() {
		return "adminpages/subpages/orderManagement/orderFinishList";
	}
	
	@GetMapping("/admin/order-product-readylist") // 주문 상품준비중 리스트
	public String OrderProductReadyList() {
		return "adminpages/subpages/orderManagement/orderProductReadyList";
	}
	
	@GetMapping("/admin/order-delivery-readylist") // 주문 배송준비중 리스트
	public String OrderDeliveryReadyList() {
		return "adminpages/subpages/orderManagement/orderDeliveryReadyList";
	}
	
	@GetMapping("/admin/order-delivery-finishlist") // 주문 배송완료 리스트
	public String OrderDeliveryFinishList() {
		return "adminpages/subpages/orderManagement/orderDeliveryFinishList";
	}
	
	@GetMapping("/admin/order-confirm-finishlist") // 주문 구매확정 리스트
	public String OrderConfirmFinishList() {
		return "adminpages/subpages/orderManagement/orderConfirmFinishList";
	}
	
	@GetMapping("/admin/order-faillist") // 주문 결제중단/실패 리스트
	public String OrderFailList() {
		return "adminpages/subpages/orderManagement/orderFailList";
	}
	
	@GetMapping("/admin/order-cancellist") // 주문 취소 리스트
	public String OrderCancelList() {
		return "adminpages/subpages/orderManagement/orderCancelList";
	}
	
	@GetMapping("/admin/order-refundlist") // 주문 반품 리스트
	public String OrderRefundList() {
		return "adminpages/subpages/orderManagement/orderRefundList";
	}
	
	@GetMapping("/admin/order-exchangelist") // 주문 교환 리스트
	public String OrderExchangeList() {
		return "adminpages/subpages/orderManagement/orderExchangeList";
	}
	
}

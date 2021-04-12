package com.web.toosome.user.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	@GetMapping("/product") // 주문가능한 상품 리스트
	public String product() {
		return "subpages/product/product";
	}
	@GetMapping("/product-detail") // 주문가능한 상품 리스트
	public String productDetail() {
		return "subpages/product/productDetail/productDetail";
	}
	
	// Product image & Product event 관련 추가...
	
	// Orders과 Order_Refund 관련 추가
}

package com.web.toosome.admin.productManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductManagementController {

	@GetMapping("/admin/product-list") // 상품 리스트
	public String productList() {
		return "adminpages/subpages/productManagement/productList";
	}
	
	@GetMapping("/admin/enroll-product") // 상품 등록
	public String EnrollProduct() {
		return "adminpages/subpages/productManagement/enrollProduct";
	}
}

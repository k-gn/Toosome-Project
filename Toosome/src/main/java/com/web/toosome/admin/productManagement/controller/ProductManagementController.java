package com.web.toosome.admin.productManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.productManagement.service.IProductManagementService;
import com.web.toosome.admin.productManagement.vo.ProductSearchVO;
import com.web.toosome.user.product.vo.ProductVO;

@Controller
@RequestMapping("/admin")
public class ProductManagementController {
	
	@Autowired
	private IProductManagementService service;

	@GetMapping("/product-list") // 상품 리스트
	public String productList() {
		return "adminpages/subpages/productManagement/productList";
	}
	
	@GetMapping("/enroll-product") // 상품 등록
	public String EnrollProduct() {
		return "adminpages/subpages/productManagement/enrollProduct";
	}
	
	@GetMapping("/plist")
	@ResponseBody
	public List<ProductVO> getProductList(ProductSearchVO product) {
		System.out.println(product);
		return service.getProductList(product);
	}
}

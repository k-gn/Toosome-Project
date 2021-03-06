package com.web.toosome.admin.productManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.productManagement.service.IProductManagementService;
import com.web.toosome.admin.productManagement.vo.ProductSearchVO;
import com.web.toosome.user.product.vo.ProductImageVO;
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
	@ResponseBody//상품 목록 리스트
	public List<ProductVO> getProductList(ProductSearchVO product) {
		System.out.println(product);
		return service.getProductList(product);
	}
	
	@GetMapping("/product/{id}")
	@ResponseBody//상품 상세조회
	public ProductVO getProduct(@PathVariable Integer id) {
		return service.getProduct(id);
	}
	
	@PostMapping("/addProduct") //상품 등록
	public String addProduct(ProductVO product, RedirectAttributes ra) {
		ProductImageVO productImage = new ProductImageVO();
		product.setProductImageVO(productImage);
		System.out.println(product);
		int result = service.addProduct(product);
		if(result > 0) ra.addFlashAttribute("msg", "success");
		else ra.addFlashAttribute("msg", "fail");
		return "redirect:/admin/enroll-product";
	}
	
	@PostMapping("/modProduct") // 상품 수정
	public String modProduct(ProductVO product, RedirectAttributes ra) {
		ProductImageVO productImage = new ProductImageVO();
		product.setProductImageVO(productImage);
		System.out.println(product);
		int result = service.modProduct(product);
		if(result > 0) ra.addFlashAttribute("msg", "modSuccess");
		else ra.addFlashAttribute("msg", "modFail");
		return "redirect:/admin/product-list";
	}
	
	@PostMapping("/delProduct") //상품 삭제
	public String delProduct(ProductVO product, RedirectAttributes ra) {
		ProductImageVO productImage = new ProductImageVO();
		product.setProductImageVO(productImage);
		System.out.println(product);
		int result = service.delProduct(product);
		if(result > 0) ra.addFlashAttribute("msg", "delSuccess");
		else ra.addFlashAttribute("msg", "delFail");
		return "redirect:/admin/product-list";
	}
}

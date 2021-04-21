package com.web.toosome.user.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.toosome.user.product.service.IProductService;
import com.web.toosome.user.product.vo.ProductPrecautionsVO;
import com.web.toosome.user.product.vo.ProductScoreVO;
import com.web.toosome.user.product.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private IProductService productService;

	@GetMapping("/product-new")
	public String productNew(ProductVO productVO, Model model) {
		System.out.println("신상품 출력");
		List<ProductVO> productNewList = productService.getproductnewList(productVO);
		model.addAttribute("productNewList", productNewList);
		System.out.println(model);
		return "subpages/product/productNew";
	}

	@GetMapping("/product-coffee")
	public String productCoffee(ProductVO productVO, Model model) {
		System.out.println("커피 상품 출력");
		List<ProductVO> productCoffeeList = productService.getcoffeeList(productVO);
		model.addAttribute("productCoffeeList", productCoffeeList);
		System.out.println(model);
		return "subpages/product/productCoffee";
	}

	@GetMapping("/product-coffeewear")
	public String productCoffeewear(ProductVO productVO, Model model) {
		System.out.println("커피웨어 상품 출력");
		List<ProductVO> productCoffeewearList = productService.getcoffeewearList(productVO);
		model.addAttribute("productCoffeewearList", productCoffeewearList);
		System.out.println(model);
		return "subpages/product/productCoffeewear";
	}

	@GetMapping("/product-gift")
	public String productGift(ProductVO productVO, Model model) {
		System.out.println("기프트세트 상품 출력");
		List<ProductVO> productGiftList = productService.getgiftList(productVO);
		model.addAttribute("productGiftList", productGiftList);
		System.out.println(model);
		return "subpages/product/productGift";
	}

	@GetMapping("/productDetail") // 주문가능한 상품 리스트
	public String productDetail(ProductVO productVO, Model model) {
		System.out.println("상품 메뉴 디테일 출력");
		ProductVO productDetail = productService.getproductDetail(productVO);
		model.addAttribute("productDetail", productDetail);
		System.out.println(productDetail);
		return "subpages/product/productDetail/productDetail";
	}
	
	
	// Product image & Product event 관련 추가...

	// Orders과 Order_Refund 관련 추가
}

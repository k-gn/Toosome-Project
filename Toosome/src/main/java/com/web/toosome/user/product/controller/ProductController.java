package com.web.toosome.user.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;


import com.web.toosome.user.product.service.IProductService;
import com.web.toosome.user.product.vo.ProductVO;

import com.web.toosome.user.product.vo.ProductReviewBoardVO;


@Controller
public class ProductController {

	@Autowired
	private IProductService productService;


	@GetMapping("/product-new")
	public String productNew(ProductVO productVO, Model model) {

		List<ProductVO> productAllList = productService.getproductnewList(productVO);
		model.addAttribute("productAllList", productAllList);

		List<ProductVO> productNewList = productService.getproductnewList(productVO);
		model.addAttribute("productNewList", productNewList);

		return "subpages/product/productNew";
	}

	@GetMapping("/product-coffee")
	public String productCoffee(ProductVO productVO, Model model) {
		List<ProductVO> productCoffeeList = productService.getcoffeeList(productVO);
		model.addAttribute("productCoffeeList", productCoffeeList);
		return "subpages/product/productCoffee";
	}

	@GetMapping("/product-coffeewear")
	public String productCoffeewear(ProductVO productVO, Model model) {
		List<ProductVO> productCoffeewearList = productService.getcoffeewearList(productVO);
		model.addAttribute("productCoffeewearList", productCoffeewearList);
		return "subpages/product/productCoffeewear";
	}

	@GetMapping("/product-gift")
	public String productGift(ProductVO productVO, Model model) {
		List<ProductVO> productGiftList = productService.getgiftList(productVO);
		model.addAttribute("productGiftList", productGiftList);
		return "subpages/product/productGift";
	}

	@GetMapping(value = "/productDetail", produces = "application/json") // 주문가능한 상품 리스트
	public String productDetail(Model model, ProductVO productVO, ProductReviewBoardVO productReviewBoardVO,HttpSession session) {
		ProductVO productDetail = productService.getproductDetail(productVO);
		model.addAttribute("productDetail", productDetail);
		//별점 평균값
		productService.productRatingAVG(productVO);
		//댓글 리스트
		System.out.println("댓글 리스트 출력");
		model.addAttribute("productReviewList", productService.productReviewList(productReviewBoardVO.getProductId()));


		return "subpages/product/productDetail/productDetail";
	}
	//상품 댓글 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/productReviewInsert")
	public String productReviewInsert(ProductReviewBoardVO productReviewBoardVO, RedirectAttributes rttr, HttpSession session) {
		productService.productReviewInsert(productReviewBoardVO);
		rttr.addAttribute("productId", productReviewBoardVO.getProductId());

		System.out.println("댓글 등록");

		return "redirect:/productDetail";
	}
	//상품 댓글 수정
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/productReviewUpdate")
	@ResponseBody
	public RedirectView productReviewUpdate(ProductReviewBoardVO productReviewBoardVO, RedirectAttributes rttr, HttpSession session){
		rttr.addAttribute("productId", productReviewBoardVO.getProductId());
		productService.productReviewUpdate(productReviewBoardVO);
		System.out.println("댓글 수정");
		return new RedirectView("/productDetail");
	}
	//상품 댓글 삭제
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/productReviewDelete")
	@ResponseBody
	public RedirectView productReviewDelete(ProductReviewBoardVO productReviewBoardVO, RedirectAttributes rttr, HttpSession session){
		rttr.addAttribute("productId", productReviewBoardVO.getProductId());
		productService.productReviewDelete(productReviewBoardVO);

		System.out.println("댓글 삭제");

		return new RedirectView("/productDetail");
	}
	




	// Product image & Product event 관련 추가...

	// Orders과 Order_Refund 관련 추가
}

package com.web.toosome.user.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.AuthVO;
import com.web.toosome.user.member.vo.MemberVO;
import com.web.toosome.user.product.service.IProductService;
import com.web.toosome.user.product.vo.ProductVO;
import com.web.toosome.user.product.vo.ProductReviewBoardVO;

@Controller
public class ProductController {

	@Autowired
	private IProductService productService;
	@Autowired
	private IMemberService memberService;

	@GetMapping("/product-new")
	public String productNew(ProductVO productVO, Model model) {
		System.out.println("신상품 출력");

		List<ProductVO> productAllList = productService.getproductnewList(productVO);
		model.addAttribute("productAllList", productAllList);

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
		return "subpages/product/productCoffee";
	}

	@GetMapping("/product-coffeewear")
	public String productCoffeewear(ProductVO productVO, Model model) {
		System.out.println("커피웨어 상품 출력");
		List<ProductVO> productCoffeewearList = productService.getcoffeewearList(productVO);
		model.addAttribute("productCoffeewearList", productCoffeewearList);
		return "subpages/product/productCoffeewear";
	}

	@GetMapping("/product-gift")
	public String productGift(ProductVO productVO, Model model) {
		System.out.println("기프트세트 상품 출력");
		List<ProductVO> productGiftList = productService.getgiftList(productVO);
		model.addAttribute("productGiftList", productGiftList);
		return "subpages/product/productGift";
	}

//	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
	@GetMapping(value = "/productDetail", produces = "application/json") // 주문가능한 상품 리스트
	public String productDetail(Model model, ProductVO productVO, ProductReviewBoardVO productReviewBoardVO,HttpSession session) {
		System.out.println("상품 메뉴 디테일 출력");
		ProductVO productDetail = productService.getproductDetail(productVO);
		model.addAttribute("productDetail", productDetail);
		System.out.println(productDetail);
		//별점 평균값
		ProductVO productavg = productService.productRatingAVG(productVO);
	
		model.addAttribute("productReviewList", productService.productReviewList(productReviewBoardVO.getProductId()));

		System.out.println("리뷰VO" + model);

		MemberVO member = memberService.getUserById((Integer) session.getAttribute("id"));
		AuthVO auth = memberService.getAuthById((String) session.getAttribute("email"));

		return "subpages/product/productDetail/productDetail";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/productReviewInsert")
	public String productReviewInsert(ProductReviewBoardVO productReviewBoardVO, RedirectAttributes rttr, HttpSession session) {
		productService.productReviewInsert(productReviewBoardVO);
		rttr.addAttribute("productId", productReviewBoardVO.getProductId());
		System.out.println("reviewInsert : " + productReviewBoardVO.getProductReviewBoardId());
		MemberVO member = memberService.getUserById((Integer) session.getAttribute("id"));
		AuthVO auth = memberService.getAuthById((String) session.getAttribute("email"));
		return "redirect:/productDetail";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/productReviewUpdate")
//	@GetMapping(value = "/reviewUpdate", produces = "application/json") // 상품 댓글 수정
	@ResponseBody
	public RedirectView productReviewUpdate(ProductReviewBoardVO productReviewBoardVO, RedirectAttributes rttr, HttpSession session){
		rttr.addAttribute("productId", productReviewBoardVO.getProductId());
		productService.productReviewUpdate(productReviewBoardVO);
	
		return new RedirectView("/productDetail");
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/productReviewDelete")
	@ResponseBody
	public RedirectView productReviewDelete(ProductReviewBoardVO productReviewBoardVO, RedirectAttributes rttr, HttpSession session){
		System.out.println(productReviewBoardVO.getProductReviewBoardId());
		rttr.addAttribute("productId", productReviewBoardVO.getProductId());
		rttr.addAttribute("reviewBoardId", productReviewBoardVO.getProductReviewBoardId());
		productService.productReviewDelete(productReviewBoardVO);
		System.out.println("getReviewBoardId : "+productReviewBoardVO.getProductReviewBoardId());
		
		return new RedirectView("/productDetail");
	}
	




	// Product image & Product event 관련 추가...

	// Orders과 Order_Refund 관련 추가
}

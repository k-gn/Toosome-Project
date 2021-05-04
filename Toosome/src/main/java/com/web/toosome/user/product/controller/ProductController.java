package com.web.toosome.user.product.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.product.service.IProductService;
import com.web.toosome.user.product.vo.ProductVO;
import com.web.toosome.user.reviewboard.service.IReviewBoardService;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

@Controller
public class ProductController {

	@Autowired
	private IProductService productService;

	@Autowired
	private IReviewBoardService reviewBoardService;
	
	@Autowired
	private IMemberService memberService;
	
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

	@RequestMapping(value = "/productDetail", method = RequestMethod.GET) // 주문가능한 상품 리스트
	public String productDetail(Principal principal,Model model,ProductVO productVO,ReviewBoardVO review) {
		System.out.println("상품 메뉴 디테일 출력");
		ProductVO productDetail = productService.getproductDetail(productVO);
		model.addAttribute("productDetail", productDetail);
		System.out.println(productDetail);
		
		List<ReviewBoardVO> reviewList = reviewBoardService.reviewList(review);
		System.out.println(reviewList);
		
		
		review.setProductId(productVO.getProductId());
		model.addAttribute("review", review);
		System.out.println(review);
		
		// 평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(5, "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_5.png");
		ratingOptions.put(4, "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_4.png");
		ratingOptions.put(3, "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_3.png");
		ratingOptions.put(2, "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_2.png");
		ratingOptions.put(1, "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_1.png");
		ratingOptions.put(0, "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/ico_star_off.png");
		model.addAttribute("ratingOptions", ratingOptions);
		// 리스트 값 체크
//		if (review.isEmpty()) {
//			// 리스트에 값이 존재하지 않음
//			System.out.println("List is empty");
//		} else { // 리스트에 값이 존재
//			
//			System.out.println("List is not empty");
//			for (int i = 1; i < review.size(); i++) {
//				// 리스트 안에 값에 대한 null 체크
//				if (review.get(i) == null) {
//					System.out.println("list[" + i + "]의 값은 null 입니다. ");
//				}
//			}
//		}
		return "subpages/product/productDetail/productDetail";
	}

	// Product image & Product event 관련 추가...

	// Orders과 Order_Refund 관련 추가
}

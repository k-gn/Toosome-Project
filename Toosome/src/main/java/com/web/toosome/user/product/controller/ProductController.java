package com.web.toosome.user.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String productDetail(Model model,@ModelAttribute("reviewBoardVO")ReviewBoardVO reviewBoardVO,ProductVO productVO) {
		System.out.println("상품 메뉴 디테일 출력");
		ProductVO productDetail = productService.getproductDetail(productVO);
		model.addAttribute("productDetail", productDetail);
		System.out.println(productDetail);
		System.out.println("댓글 디테일 출력");
		int productId = productVO.getProductId();
		List<ReviewBoardVO> reviewBoardList = reviewBoardService.reviewList(productId);
		System.out.println(productVO.getProductId());

		// 리스트 값 체크
		if (reviewBoardList.isEmpty()) {
			// 리스트에 값이 존재하지 않음
			System.out.println("List is empty");
		} else { // 리스트에 값이 존재
			
			System.out.println("List is not empty");
			for (int i = 0; i < reviewBoardList.size(); i++) {
				// 리스트 안에 값에 대한 null 체크
				if (reviewBoardList.get(i) == null) {
					System.out.println("list[" + i + "]의 값은 null 입니다. ");
				}
			}
		}
		System.out.println(reviewBoardService.reviewList(productVO.getProductId()));
		model.addAttribute("reviewBoardList", reviewBoardList);
		System.out.println(reviewBoardList);
		return "subpages/product/productDetail/productDetail";
	}

	@PostMapping("/reviewInsert") // qna 댓글입력
	public String reviewInsert(ReviewBoardVO reviewBoardVO, RedirectAttributes ra) throws Exception {
		System.out.println("ReviewBoardVO : " + reviewBoardVO);
		int insert = reviewBoardService.reviewInsert(reviewBoardVO);
		if (insert > 0) {
			ra.addFlashAttribute("msg", "insertSuccess");
		} else {
			ra.addFlashAttribute("msg", "insertFail");
		}
		return "redirect:/productDetail?productId=" + reviewBoardVO.getProductId();
	}

	@GetMapping(value = "/reviewUpdate", produces = "application/json") // qna 댓글 업데이트
	@ResponseBody
	public String reviewUpdate(ReviewBoardVO reviewBoardVO, RedirectAttributes ra) throws Exception {
		int update = reviewBoardService.reviewUpdate(reviewBoardVO);
		if (update > 0) {
			ra.addFlashAttribute("msg", "updateSuccess");
		} else {
			ra.addFlashAttribute("msg", "updateFail");
		}
		return "redirect:/productDetail?productId=" + reviewBoardVO.getProductId();
	}

	@GetMapping(value = "/reviewDelete", produces = "application/json") // qna 댓글 삭제
	@ResponseBody
	public String reviewDelete(ReviewBoardVO reviewBoardVO, RedirectAttributes ra) throws Exception {
		int delete = reviewBoardService.reviewDelete(reviewBoardVO);
		if (delete > 0) {
			ra.addFlashAttribute("msg", "deleteSuccess");
		} else {
			ra.addFlashAttribute("msg", "deleteFail");
			;
		}
		return "redirect:/productDetail?productId=" + reviewBoardVO.getProductId();
	}

	// Product image & Product event 관련 추가...

	// Orders과 Order_Refund 관련 추가
}

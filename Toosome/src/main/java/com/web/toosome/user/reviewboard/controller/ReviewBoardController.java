package com.web.toosome.user.reviewboard.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.user.reviewboard.service.IReviewBoardService;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

public class ReviewBoardController {

	@Autowired
	private IReviewBoardService reviewBoardService;

	@PostMapping("/reviewInsert") // 상품 댓글 입력
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

	@GetMapping(value = "/reviewUpdate", produces = "application/json") // 상품 댓글 수정
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

	@GetMapping(value = "/reviewDelete", produces = "application/json") // 상품 댓글 삭제
	@ResponseBody
	public String reviewDelete(ReviewBoardVO reviewBoardVO, RedirectAttributes ra) throws Exception {
		int delete = reviewBoardService.reviewDelete(reviewBoardVO);
		if (delete > 0) {
			ra.addFlashAttribute("msg", "deleteSuccess");
		} else {
			ra.addFlashAttribute("msg", "deleteFail");
		}
		return "redirect:/productDetail?productId=" + reviewBoardVO.getProductId();
	}

}

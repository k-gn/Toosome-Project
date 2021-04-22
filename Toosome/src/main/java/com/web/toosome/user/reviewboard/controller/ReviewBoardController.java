package com.web.toosome.user.reviewboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.toosome.user.menu.vo.MenuVO;
import com.web.toosome.user.product.vo.ProductVO;
import com.web.toosome.user.reviewboard.dao.IReviewBoardMapper;
import com.web.toosome.user.reviewboard.service.IReviewBoardService;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

@Controller
public class ReviewBoardController {
	/*
	@Autowired
	private IReviewBoardService reviewboardService;
	@Autowired
	private IReviewBoardMapper reviewboardMapper;
	
	@GetMapping("/reviewDetail") // 주문가능한 상품 리스트
	public String reviewDetail(ReviewBoardVO reviewBoardVO,ProductVO productVO, MenuVO menuVO, 
			HttpSession session, HttpServletRequest request)throws Exception {
		String reviewBoardType = request.getParameter("reviewBoardType");
		Integer memberMemberId = (Integer)session.getAttribute("memberMemberId");
		String reviewBoardContent = request.getParameter("reviewBoardContent");
		int reviewBoardRating = Integer.parseInt(request.getParameter("reviewBoardRating"));
		
		reviewBoardVO.setMemberMemberId(memberMemberId);
		reviewBoardVO.setReviewBoardRating(reviewBoardRating);
		reviewBoardVO.setReviewBoardContent(reviewBoardContent);
		reviewboardService.reviewInsert(reviewBoardVO);
		reviewboardService.reviewUpdate(reviewBoardType);
		productVO.setProductTitleName(reviewBoardType);
		menuVO.setMenuMainTitle(reviewBoardType);
		productVO.setProductStar(reviewBoardRating);
		reviewboardService.reviewUpdate(reviewBoardVO);
		reviewboardService.reviewDelete(reviewBoardVO);
		return "subpages/product/productDetail/productDetail";

	}
	*/
}
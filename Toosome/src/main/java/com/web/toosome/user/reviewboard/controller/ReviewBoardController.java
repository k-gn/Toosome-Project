package com.web.toosome.user.reviewboard.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.toosome.user.reviewboard.service.IReviewBoardService;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

@Controller
public class ReviewBoardController {
	
	@Autowired
	private IReviewBoardService reviewBoardService;

	// 댓글 리스트
	@RequestMapping(value = "/list", produces = "application/json; charset=UTF-8")
	private List<ReviewBoardVO> mReviewServiceList(@RequestParam int productProductId) // List<ReviewBoardVO>를 전달 받음
			throws Exception {
		List<ReviewBoardVO> reviewBoardList = reviewBoardService.getreviewBoardList(productProductId);

		return reviewBoardList; // List<ReviewBoardVO> 객체(reviewBoardList) 전달
	}

	// 댓글 작성
	@RequestMapping(value = "/insert", produces = "application/json; charset=UTF-8")
	private int mReviewServiceInsert(ReviewBoardVO reviewBoardVO, HttpSession session) throws Exception {
		reviewBoardVO.setReviewBoardWriter((String) session.getAttribute("memberName"));

		return reviewBoardService.reviewBoardInsert(reviewBoardVO);
	}

	// 댓글 수정
	@RequestMapping(value = "/update", produces = "application/json; charset=UTF-8")
	private int mReviewServiceUpdateProc(ReviewBoardVO reviewBoardVO) // 의존성 주입을 통해서 content, cno가 comment에 저장된다.
			throws Exception {

		return reviewBoardService.reviewBoardUpdate(reviewBoardVO);
	}
	
/*
	@RequestMapping(value="/update", produces="application/json; charset=UTF-8")
	private int mCommentServiceUpdateProc(@RequestParam int reviewBoardId, @RequestParam String reviewBoardContent) 
	throws Exception {
		ReviewBoardVO reviewBoardVO = new ReviewBoardVO();
		reviewBoardVO.setReviewBoardId(reviewBoardId);
		reviewBoardVO.setReviewBoardContent(reviewBoardContent);
			
		return reviewBoardService.reviewBoardUpdate(reviewBoardVO);
	}
*/
	
	//댓글 삭제
	@RequestMapping(value="/delete", produces="application/json; charset=UTF-8")
	private int mReviewServiceDelete(@RequestParam(value="reviewBoardId") int reviewBoardId)throws Exception {
		
		return reviewBoardService.reviewBoardDelete(reviewBoardId);	//삭제한 레코드 개수가 반환된다. 삭제가 잘 됐을 경우 1 반환
	}
}

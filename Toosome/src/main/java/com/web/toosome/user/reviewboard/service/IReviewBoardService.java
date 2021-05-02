package com.web.toosome.user.reviewboard.service;

import java.util.List;

import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

public interface IReviewBoardService {
	// 댓글 개수
//	public int reviewCount(int reviewBoardId) throws Exception; 					
	// 댓글 조회
	public List<ReviewBoardVO>reviewList(Integer productId) throws NumberFormatException;	
	// 댓글 작성
//	public int reviewInsert(ReviewBoardVO reviewBoardVO) throws Exception;	
	// 댓글 수정
//	public int reviewUpdate(ReviewBoardVO reviewBoardVO) throws Exception;	
	// 댓글 삭제
//	public int reviewDelete(ReviewBoardVO reviewBoardVO) throws Exception;   

}

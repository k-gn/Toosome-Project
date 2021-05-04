package com.web.toosome.user.reviewboard.service;

import java.util.List;


import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

public interface IReviewBoardService {
	// 댓글 조회
	public List<ReviewBoardVO>reviewList(ReviewBoardVO reviewBoardVO);
	// 댓글 작성
	public int reviewInsert(ReviewBoardVO reviewBoardVO);
	// 댓글 수정
	public int reviewUpdate(ReviewBoardVO reviewBoardVO);
	// 댓글 삭제
	public int reviewDelete(ReviewBoardVO reviewBoardVO); 

}

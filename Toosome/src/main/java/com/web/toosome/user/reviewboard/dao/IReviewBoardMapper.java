package com.web.toosome.user.reviewboard.dao;

import java.util.List;

import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

public interface IReviewBoardMapper {

	// 댓글 개수
//	public int reviewCount(int reviewBoardId) throws Exception;

	// 댓글 조회
	public List<ReviewBoardVO> reviewList(Integer reviewBoardVO) throws NumberFormatException;

	// 댓글 작성
//	public int reviewInsert(ReviewBoardVO reviewBoardVO) throws Exception;

	// 댓글 수정
//	public int reviewUpdate(ReviewBoardVO reviewBoardVO) throws Exception;

	// 댓글 삭제
//	public int reviewDelete(ReviewBoardVO reviewBoardVO) throws Exception;

}

package com.web.toosome.user.reviewboard.dao;

import java.util.List;


import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

public interface IReviewBoardMapper {
	

	// 댓글 갯수
    public int reviewBoardCount() throws Exception;
	
    // 댓글 목록
	public List<ReviewBoardVO> getreviewBoardList(int productProductId) throws Exception;

	// 댓글 작성
	public int reviewBoardInsert(ReviewBoardVO reviewBoardVO) throws Exception;

	// 댓글 수정
	public int reviewBoardUpdate(ReviewBoardVO reviewBoardVO) throws Exception;

	// 댓글 삭제
	public int reviewBoardDelete(int reviewBoardId) throws Exception;

}

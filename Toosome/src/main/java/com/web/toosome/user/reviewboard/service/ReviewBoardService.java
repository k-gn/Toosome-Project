package com.web.toosome.user.reviewboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.reviewboard.dao.IReviewBoardMapper;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

@Service
public class ReviewBoardService implements IReviewBoardService{
	
	@Autowired
	private IReviewBoardMapper reviewBoardMapper;

	
	@Override
	public int reviewBoardCount() throws Exception {
		
		return reviewBoardMapper.reviewBoardCount();
	}
	
	@Override
	public List<ReviewBoardVO> getreviewBoardList(int productProductId) throws Exception {
		
		return reviewBoardMapper.getreviewBoardList(productProductId);
	}

	@Override
	public int reviewBoardInsert(ReviewBoardVO reviewBoardVO) throws Exception {
		
		return reviewBoardMapper.reviewBoardInsert(reviewBoardVO);
		
	}

	@Override
	public int reviewBoardUpdate(ReviewBoardVO reviewBoardVO) throws Exception {
		
		return reviewBoardMapper.reviewBoardUpdate(reviewBoardVO);
	}

	@Override
	public int reviewBoardDelete(int reviewBoardId) throws Exception {
		
		return reviewBoardMapper.reviewBoardDelete(reviewBoardId);
		
	}


}

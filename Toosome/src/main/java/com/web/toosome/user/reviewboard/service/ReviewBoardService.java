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

//	@Override
//	public int reviewCount(int reviewBoardId) throws Exception {
//		return reviewBoardMapper.reviewCount(reviewBoardId);
//	}

	@Override
	public List<ReviewBoardVO> reviewList(Integer productId) throws NumberFormatException{
		return reviewBoardMapper.reviewList(productId);
	}

//	@Override
//	public int reviewInsert(ReviewBoardVO reviewBoardVO) throws Exception {
//		return reviewBoardMapper.reviewInsert(reviewBoardVO);
//	}
//
//	@Override
//	public int reviewUpdate(ReviewBoardVO reviewBoardVO) throws Exception {
//		return reviewBoardMapper.reviewUpdate(reviewBoardVO);
//	}
//
//	@Override
//	public int reviewDelete(ReviewBoardVO reviewBoardVO) throws Exception {
//		return reviewBoardMapper.reviewDelete(reviewBoardVO);
//	}

	
	
}

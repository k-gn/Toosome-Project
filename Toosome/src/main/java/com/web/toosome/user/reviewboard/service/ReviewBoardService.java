package com.web.toosome.user.reviewboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.reviewboard.dao.IReviewBoardMapper;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

@Service
public class ReviewBoardService implements IReviewBoardService {
	@Autowired
	private IReviewBoardMapper reviewmapper;

	@Override
	public ArrayList<ReviewBoardVO> getreviewList(int productProductId, int menuMenuId) {
		return null;
	}

	@Override
	public ReviewBoardVO reviewDetail(int reviewBoardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean reviewInsert(ReviewBoardVO reviewBoardVO) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean reviewDelete(ReviewBoardVO reviewBoardVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean giveStar() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int currentReview_id() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int currentReview_asc() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int currentReview_answer() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertImage() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean reviewUpdate(ReviewBoardVO reviewBoardVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void reviewUpdate(String reviewBoardType) {
		// TODO Auto-generated method stub
		
	}
	

}

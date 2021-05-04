package com.web.toosome.user.reviewboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import com.amazonaws.services.s3.transfer.Upload;
import com.web.toosome.user.product.vo.ProductVO;
import com.web.toosome.user.reviewboard.dao.IReviewBoardMapper;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

@Service
public class ReviewBoardService implements IReviewBoardService{
	
	@Autowired
	private IReviewBoardMapper reviewBoardMapper;
	
	

	@Override
	public List<ReviewBoardVO> reviewList(ReviewBoardVO reviewBoardVO){
		return reviewBoardMapper.reviewList(reviewBoardVO);
	}

	@Override
	public int reviewInsert(ReviewBoardVO reviewBoardVO){
		return reviewBoardMapper.reviewInsert(reviewBoardVO);
	}

	@Override
	public int reviewUpdate(ReviewBoardVO reviewBoardVO) {
		return reviewBoardMapper.reviewUpdate(reviewBoardVO);
	}

	@Override
	public int reviewDelete(ReviewBoardVO reviewBoardVO) {
		return reviewBoardMapper.reviewDelete(reviewBoardVO);
	}

	
	
}

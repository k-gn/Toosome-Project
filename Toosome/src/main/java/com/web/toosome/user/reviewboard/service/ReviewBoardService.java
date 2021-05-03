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
	
	public int s3Upload(MultipartFile file, String fname) {
		AmazonS3 amazonS3 = null;
		String bucket = null;

		AWSCredentials creds = new BasicAWSCredentials("AKIA2EEFD7LC3HPT4W5F",
				"HysDDMERwtehAGKvBMK35xeUr2NsM++Bwz66l615");
		amazonS3 = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(creds))
				.withRegion(Regions.AP_NORTHEAST_2) // region
				.withForceGlobalBucketAccessEnabled(true) // access
				.build();
		bucket = "toosome";
		TransferManager tm = TransferManagerBuilder.standard().withS3Client(amazonS3).build();
		PutObjectRequest request;
		try {
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setCacheControl("604800"); // 60*60*24*7 일주일
			metadata.setContentType("image/jpeg");
			request = new PutObjectRequest(bucket, fname, file.getInputStream(), metadata)
					.withCannedAcl(CannedAccessControlList.PublicRead);
			// amazonS3.putObject(request);
			Upload upload = tm.upload(request);
			upload.waitForCompletion();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Override
	public int reviewCount(int reviewBoardId) throws Exception {
		return reviewBoardMapper.reviewCount(reviewBoardId);
	}

	@Override
	public List<ReviewBoardVO> reviewList(int productId){
		return reviewBoardMapper.reviewList(productId);
	}

	@Override
	public int reviewInsert(ReviewBoardVO reviewBoardVO) throws Exception {
		return reviewBoardMapper.reviewInsert(reviewBoardVO);
	}

	@Override
	public int reviewUpdate(ReviewBoardVO reviewBoardVO) throws Exception {
		return reviewBoardMapper.reviewUpdate(reviewBoardVO);
	}

	@Override
	public int reviewDelete(ReviewBoardVO reviewBoardVO) throws Exception {
		return reviewBoardMapper.reviewDelete(reviewBoardVO);
	}

	
	
}

package com.web.toosome.user.menu.service;

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
import com.web.toosome.user.menu.dao.IMenuMapper;
import com.web.toosome.user.menu.vo.MenuVO;

@Service
public class MenuService implements IMenuService {
	
	@Autowired
	private IMenuMapper mapper;
	
	public int s3Upload(MultipartFile file, String fname) {
		AmazonS3 amazonS3 = null;
		String bucket = null;
		
		AWSCredentials creds = new BasicAWSCredentials("AKIA2EEFD7LC3HPT4W5F", "HysDDMERwtehAGKvBMK35xeUr2NsM++Bwz66l615");
		amazonS3 = 
				AmazonS3ClientBuilder.standard()
					.withCredentials(new AWSStaticCredentialsProvider(creds))
					.withRegion(Regions.AP_NORTHEAST_2)       // region
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
			//amazonS3.putObject(request);
			Upload upload = tm.upload(request);
			upload.waitForCompletion();
			return 1;
		} catch (Exception e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<MenuVO> getbeverageList(MenuVO menuVO) {
		return mapper.getbeverageList(menuVO);
	}
}

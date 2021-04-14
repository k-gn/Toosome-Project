package com.web.toosome.common.s3;

import java.io.File;
import java.io.InputStream;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3Service {
	
	private AmazonS3 s3Client;
	
	private String bucket;
    private String accessKey;
    private String secretKey;
    private Regions clientRegion;
    
    public S3Service() {}
    
	public S3Service(String bucket, String accessKey, String secretKey) {
		this.bucket = bucket;
		this.accessKey = accessKey;
		this.secretKey = secretKey;
		this.clientRegion = Regions.AP_NORTHEAST_2;
		createS3Client();
	}

	private void createS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		this.s3Client = AmazonS3ClientBuilder
					.standard()
					.withCredentials(new AWSStaticCredentialsProvider(credentials))
					.withRegion(clientRegion)
					.build();
	}
	
	// upload method
	public void upload(File file, String key) {
		System.out.println(s3Client.getUrl(bucket, key).toString());
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);
		uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
	}

	// PutObjectRequest는 AWS S3 버킷에 업로드할 객체 메타 데이터와 파일 데이터로 이루어짐
	private void uploadToS3(PutObjectRequest putObjectRequest) {
		try {
			System.out.println("uploadToS3 before");
			s3Client.putObject(putObjectRequest);
			System.out.println("uploadToS3 after");
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void copy(String orgKey, String copyKey) {
		try {
			CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			this.s3Client.copyObject(copyObjectRequest);
			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String key) {
		try {
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			System.out.println(String.format("delete complete [%s]", key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

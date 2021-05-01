package com.toosome.web;

import java.io.File;
import java.io.InputStream;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.web.toosome.common.s3.S3Service;

public class Main {
	
	public S3Service awsS3 = S3Service.getInstance();
	
	public static void main(String[] args) {
		
		String test = "img/beverage/b01.png";
		System.out.println(test.substring(0, test.lastIndexOf('/')));
		
//		Main main = new Main();
//	
//		File file = new File("C:\\ex.png");
//		String key = "img/main123.png";
	//	main.upload(file, key);
//		main.delete(key);
	}

	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}
	
	public void delete(String key) {
		awsS3.delete(key);
	}
	
}

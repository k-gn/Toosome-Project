package com.toosome.web;

import java.io.File;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

import com.web.toosome.common.s3.S3Service;

public class Main {
	
	public S3Service awsS3 = S3Service.getInstance();
	
	public static void main(String[] args) {
		Main main = new Main();
	
		File file = new File("C:\\ex.png");
		String key = "img/main123.png";
		main.upload(file, key);

	}

	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}
	
}

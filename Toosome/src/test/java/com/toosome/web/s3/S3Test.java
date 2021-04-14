package com.toosome.web.s3;

import java.io.File;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.toosome.common.s3.S3Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class S3Test {

	@Autowired
	private S3Service awsS3;
	
	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}
	
	public void copy(String orgKey, String copyKey) {
		awsS3.copy(orgKey, copyKey);
	}
	
	public void delete(String key) {
		awsS3.delete(key);
	}
	
	@Test
	public void main() {
		File file = new File("C:\\upload\\kya.jpg");
		String key = "img/kya.jpg";
		String copyKey = "img/kya_copy.jpg";
		upload(file, key);
		delete(key);
	}
}

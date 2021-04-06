package com.web.toosome.admin.sns.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SnsController {

	@Autowired
    private JavaMailSenderImpl mailSender;
	
	// 이메일 인증
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		
		Random random = new Random();
		int checkNum = random.nextInt(899999) + 100000;

		/* 이메일 보내기 */
		String setFrom = "qkd2186@naver.com"; // 발신자 메일
		String toMail = email; // 수신자 메일
		String title = "회원가입 인증 이메일 입니다."; // 메일 제목
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>" // 메일 내용
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");	// true 사용이유 : 단순 텍스만 보낼려면 true를 사용하지 않아도 된다. html 허용의 의미
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);	// true 사용이유 : 단순 텍스만 보낼려면 true를 사용하지 않아도 된다. html 허용의 의미
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		
		return num;
	}
	

}
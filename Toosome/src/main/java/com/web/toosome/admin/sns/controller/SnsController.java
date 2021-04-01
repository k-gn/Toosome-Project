package com.web.toosome.admin.sns.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SnsController {

	// 문자 인증 테스트
	@ResponseBody
	@RequestMapping("/sendSms")
	public String sendSms(String receiver) {
		// 6자리 인증 코드 생성
		int rand = (int) (Math.random() * 899999) + 100000;
		// 인증 코드를 데이터베이스에 저장하는 코드는 생략했습니다.
		// 문자 보내기
		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
				// 청기와랩에 등록한 Application Id 와 API key 를 입력합니다.
				new UsernamePasswordCredentials("Application Id", "API key"));
		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());
		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);
		HttpClient client = HttpClientBuilder.create().build();
		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");
			// 문자에 대한 정보
			String json = "{\"sender\":\"보내는 사람\",\"receivers\":[\"" + receiver + "\"],\"content\":\"문자 내용\"}";
			StringEntity se = new StringEntity(json, "UTF-8");
			httpPost.setEntity(se);
			HttpResponse httpResponse = client.execute(httpPost, context);
			InputStream inputStream = httpResponse.getEntity().getContent();
			if (inputStream != null) {
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = "";
				while ((line = bufferedReader.readLine()) != null)
					inputStream.close();
			}
		} catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
		} finally {
			client
		}
		return "true";
	}

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

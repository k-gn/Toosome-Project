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

	// ���� ���� �׽�Ʈ
	@ResponseBody
	@RequestMapping("/sendSms")
	public String sendSms(String receiver) {
		// 6�ڸ� ���� �ڵ� ����
		int rand = (int) (Math.random() * 899999) + 100000;
		// ���� �ڵ带 �����ͺ��̽��� �����ϴ� �ڵ�� �����߽��ϴ�.
		// ���� ������
		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
				// û��ͷ��� ����� Application Id �� API key �� �Է��մϴ�.
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
			// ���ڿ� ���� ����
			String json = "{\"sender\":\"������ ���\",\"receivers\":[\"" + receiver + "\"],\"content\":\"���� ����\"}";
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
		}
		return "true";
	}

	@Autowired
    private JavaMailSenderImpl mailSender;
	
	// �̸��� ����
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		
		Random random = new Random();
		int checkNum = random.nextInt(899999) + 100000;

		/* �̸��� ������ */
		String setFrom = "qkd2186@naver.com"; // �߽��� ����
		String toMail = email; // ������ ����
		String title = "ȸ������ ���� �̸��� �Դϴ�."; // ���� ����
		String content = "Ȩ�������� �湮���ּż� �����մϴ�." + "<br><br>" + "���� ��ȣ�� " + checkNum + "�Դϴ�." + "<br>" // ���� ����
				+ "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");	// true ������� : �ܼ� �ؽ��� �������� true�� ������� �ʾƵ� �ȴ�. html ����� �ǹ�
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);	// true ������� : �ܼ� �ؽ��� �������� true�� ������� �ʾƵ� �ȴ�. html ����� �ǹ�
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		
		return num;
	}
	

}

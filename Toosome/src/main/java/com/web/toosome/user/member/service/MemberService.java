package com.web.toosome.user.member.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public boolean emailDupCheck(String email) {
		boolean flag = true;
		int result = mapper.emailDupCheck(email);
		if(result > 0) flag = false;
		return flag;
	}

	@Override
	public void register(MemberVO member) {
		String encodePassword = bCryptPasswordEncoder.encode(member.getMemberPassword());
		member.setMemberPassword(encodePassword);
		mapper.register(member);
	}
	
	@Override
	public MemberVO getUserByEmail(String email) {
		return mapper.getUserByEmail(email);
	}
	
	public void certifiedPhoneNumber(String phoneNumber, String num) {
		String api_key = "NCSYDBSNPVO2LUFF";
		String api_secret = "KX2XFULHJHUWMWIETWORN3ZN0TD3K4LD";
		Message coolsms = new Message(api_key, api_secret);
		System.out.println("3");
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 諛쒖떊踰덊샇
		params.put("from", "01056592176"); // �닔�떊踰덊샇
		params.put("type", "SMS");
		params.put("text", "CoolSMS<br>" + "�씤利� 踰덊샇�뒗 " + num + "�엯�땲�떎." + "�빐�떦 �씤利앸쾲�샇瑜� �씤利앸쾲�샇 �솗�씤���뿉 湲곗엯�븯�뿬 二쇱꽭�슂.");
		params.put("app_version", "test app 1.2"); // application name and version
		System.out.println("4");
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}

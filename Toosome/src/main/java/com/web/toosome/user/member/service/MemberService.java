package com.web.toosome.user.member.service;

import java.util.HashMap;


import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	// 이메일 중복 확인
	@Override
	public boolean emailDupCheck(String email) {
		boolean flag = true;
		int result = mapper.emailDupCheck(email);
		if(result > 0) flag = false;
		return flag;
	}

	// 회원 등록 (사용자)
	@Transactional
	@Override
	public void registerMember(MemberVO member) {
		if(member.getMemberPassword() != null) {
			String encodePassword = bCryptPasswordEncoder.encode(member.getMemberPassword());
			member.setMemberPassword(encodePassword);
		}
		mapper.registerMember(member);
		mapper.registerMemberAuth(member.getMemberEmail());
	}
	
	// 관리자
	@Override
	public void registerAdmin(MemberVO member) {
		String encodePassword = bCryptPasswordEncoder.encode(member.getMemberPassword());
		member.setMemberPassword(encodePassword);
		mapper.registerAdmin(member);
		mapper.registerAdminAuth(member.getMemberEmail());
	}
	
	// 이메일로 회원 조회
	@Override
	public MemberVO getUserByEmail(String email) {
		return mapper.getUserByEmail(email);
	}
	
	// 아이디 찾기 & 비밀번호 찾기 인증 번호 전송
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String num) {
		String api_key = "NCSYDBSNPVO2LUFF";
		String api_secret = "KX2XFULHJHUWMWIETWORN3ZN0TD3K4LD";
		Message coolsms = new Message(api_key, api_secret);
		System.out.println("3");
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 발신번호
		params.put("from", "01056592176"); // 수신번호
		params.put("type", "SMS");
		params.put("text", "CoolSMS<br>" + "인증 번호는 " + num + "입니다." + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.");
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
	
	// 아이디 찾기
	@Override
	public MemberVO getSMS(MemberVO vo) {
		return mapper.getSMS(vo);
	}
	// 이메일 찾기
	@Override
	public MemberVO getMail(MemberVO vo) {
		return mapper.getMail(vo);
	}
	// 비밀번호 찾기
	@Override
	public MemberVO getPassword(MemberVO vo) {
		return mapper.getPassword(vo);
	}
	// 비밀번호 찾기 랜덤비밀번호 전송
	@Override
	public int getRepassword(MemberVO vo) {
		String repass = bCryptPasswordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(repass);
		return  mapper.getRepassword(vo);
	}

}

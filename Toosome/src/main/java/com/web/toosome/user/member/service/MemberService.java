package com.web.toosome.user.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.vo.MemberVO;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 이메일 중복 체크
	public boolean emailDupCheck(String email) {
		boolean flag = true;
		int result = mapper.emailDupCheck(email);
		if(result > 0) flag = false;
		return flag;
	}

	// 일반 회원가입
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
}

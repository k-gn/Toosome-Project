package com.web.toosome.user.member.service;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberService {

	// 이메일 중복 체크
	public boolean emailDupCheck(String email);

	// 회원 등록
	public void register(MemberVO member);

	// 이메일로 회원 조회
	public MemberVO getUserByEmail(String email);

	public void certifiedPhoneNumber(String phoneNumber, String num);
}

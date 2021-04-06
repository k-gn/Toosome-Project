package com.web.toosome.user.member.dao;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberMapper {

	public Integer emailDupCheck(String email);

	public void register(MemberVO member);

	public MemberVO getUserByEmail(String email);
	
	// 아이디 찾기
	public MemberVO getSMS(MemberVO vo);
	
	// 아이디 찾기 ID 전송.
	public MemberVO getMail(MemberVO vo);
	
	// 비밀번호 찾기
	public MemberVO getPassword(MemberVO vo);
	
	// 비밀번호 찾기 랜덤비밀번호 전송
	public MemberVO getRepassword(MemberVO vo);
	
}

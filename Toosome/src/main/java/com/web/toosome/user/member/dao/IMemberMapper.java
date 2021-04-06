package com.web.toosome.user.member.dao;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberMapper {

	// 이메일 중복 체크
	public Integer emailDupCheck(String email);

	// 일반 회원가입
	public void register(MemberVO member);

	// 회원 조회
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

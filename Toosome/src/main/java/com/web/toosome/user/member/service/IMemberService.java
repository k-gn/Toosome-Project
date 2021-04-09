package com.web.toosome.user.member.service;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberService {

	// 이메일 중복확인
	public boolean emailDupCheck(String email);

	// 회원 등록 (사용자)
	public void registerMember(MemberVO member);

	// 회원 등록 (관리자)
	public void registerAdmin(MemberVO member);

	// 이메일로 회원 조회
	public MemberVO getUserByEmail(String email);

	// 아이디 찾기 & 비밀번호 찾기 인증 번호 전송
	public void certifiedPhoneNumber(String phoneNumber, String num);

	// 아이디 찾기
	public MemberVO getSMS(MemberVO vo);

	// 아이디 찾기 ID 전송.
	public MemberVO getMail(MemberVO vo);

	// 비밀번호 찾기
	public MemberVO getPassword(MemberVO vo);

	// 비밀번호 찾기 랜덤비밀번호 전송
	public int getRepassword(MemberVO vo);

}

package com.web.toosome.user.member.dao;

import java.util.Map;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberMapper {

	// 이메일 중복 체크
	public Integer emailDupCheck(String email);

	// 회원 등록 (사용자)
	public void registerMember(MemberVO member);
	
	// 회원 권한 등록 (사용자)
	public void registerMemberAuth(String email);
	
	// 회원 등록 (관리자)
	public void registerAdmin(MemberVO member);
	
	// 회원 권한 등록 (관리자)
	public void registerAdminAuth(String email);

	// 이메일로 회원 조회
	public MemberVO getUserByEmail(String email);
	
	// 아이디 찾기
	public MemberVO getSMS(MemberVO vo);
	
	// 아이디 찾기 ID 전송.
	public MemberVO getMail(MemberVO vo);
	
	// 비밀번호 찾기
	public MemberVO getPassword(MemberVO vo);
	
	// 비밀번호 찾기 랜덤비밀번호 전송
	public int getRepassword(MemberVO vo);
	
	// 사용자 플랫폼 타입 변경
	public void updatePlatForm(Map<String, String> map);
}

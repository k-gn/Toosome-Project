package com.web.toosome.user.member.dao;

import java.util.Map;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberMapper {

	// 이메일 중복 체크
	public Integer emailDupCheck(String email);

	// 회원 등록 (사용자)
	public int registerMember(MemberVO member);
	
	// 회원 권한 등록 (사용자)
	public void registerMemberAuth(String email);
	
	// 회원 등록 (관리자)
	public int registerAdmin(MemberVO member);
	
	// 회원 권한 등록 (관리자)
	public void registerAdminAuth(String email);

	// 이메일로 회원 조회
	public MemberVO getUserByEmail(String email);
	
	// 아이디로 회원 조회
	public MemberVO getUserById(int id);
	
	// 회원정보 수정
	public int updateMember(MemberVO vo);
	
	// 회원 탈퇴
	public int deleteMember(int id);
	
	// 회원 권한 제거
	public int deleteMemberAuth(String email);
	
	// 아이디 찾기 (번호로)
	public MemberVO getSMS(MemberVO vo);
	
	// 아이디 찾기 ID 전송. (번호로)
	public MemberVO getMail(MemberVO vo);
	
	// 비밀번호 찾기 (번호로)
	public MemberVO getPassword(MemberVO vo);
	
	// 비밀번호 찾기 랜덤비밀번호 전송 (번호로)
	public int getRepassword(MemberVO vo);
	
	// 사용자 플랫폼 타입 변경
	public void updatePlatForm(Map<String, String> map);
	
	// 아이디로 비밀번호 찾기 (비밀번호 체크용)
	public String passwordCheck(int id);
	
	// 비밀번호 변경
	public int changePassword(Map<String, Object> map);
	
	// 최종 로그인 등록
	public void updateLastLogin(String email);
}

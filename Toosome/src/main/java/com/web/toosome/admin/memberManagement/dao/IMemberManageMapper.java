package com.web.toosome.admin.memberManagement.dao;

import java.util.List;

import com.web.toosome.admin.memberManagement.vo.WithdrawVO;
import com.web.toosome.user.member.vo.MemberSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberManageMapper {

	// 아이디 or 이메일로 검색 + 일반 or 간편 + 가입일 + 최종 로그인일
	public List<MemberVO> getMemberList(MemberSearchVO search);
	
	// 회원 조회
	public MemberVO getMember(Integer id);
	
	// 회원 정보 수정
	public int updateMember(MemberVO member);
	
	// 탈퇴 회원 목록 조회
	public List<WithdrawVO> getOutList(MemberSearchVO search);

	// 탈퇴 회원 조회
	public WithdrawVO getOutMember(Integer id);
	
	// 이메일로 탈퇴 회원 조회
	public WithdrawVO getOutMemberByEmail(String email);
	
	// 이메일로 탈퇴 회원 삭제
	public int delOutMember(String email);
}

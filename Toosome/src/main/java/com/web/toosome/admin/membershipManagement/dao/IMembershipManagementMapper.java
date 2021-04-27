package com.web.toosome.admin.membershipManagement.dao;

import java.util.List;

import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipManagementMapper {

	// 멤버쉽 회원 목록 조회
	public List<MembershipVO> getMembershipMemberList(MembershipSearchVO search);
	
	// 멤버쉽 회원 조회
	public MembershipVO getMembershipMember(Integer id);
	
	// 멤버쉽 회원 정보 수정
	public int updateMembership(MembershipVO membership);
	
	// 등급 조회
	public LevelVO getLevel(Integer id);
	
	// 등급 전체 조회
	public List<LevelVO> getLevelList();
	
	// 등급 등록
	public int insertLevel(LevelVO level);
	
	// 등급 수정
	public int updateLevel(LevelVO level);
	
	// 등급 갯수
	public int countLevel();
	
	// LEVEL AI 초기화
	public void aiReset();
	
}

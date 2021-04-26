package com.web.toosome.admin.membershipManagement.dao;

import java.util.List;

import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipManagementMapper {

	// 멤버쉽 회원 목록 조회
	public List<MembershipVO> getMembershipMember(MembershipSearchVO search);
	
	// 멤버쉽 회원 조회
	public MembershipVO getMembershipMember(Integer id);
	
	// 등급 조회
	public LevelVO getLevel(Integer id);
	
}

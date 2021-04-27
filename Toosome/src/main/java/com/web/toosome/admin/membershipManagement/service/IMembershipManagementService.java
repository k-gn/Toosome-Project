package com.web.toosome.admin.membershipManagement.service;

import java.util.List;

import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipManagementService {

	public List<MembershipVO> getMembershipMemberList(MembershipSearchVO search);

	public MembershipVO getMembershipMember(Integer id);

	public int updateMembership(MembershipVO membership);

	public LevelVO getLevel(Integer id);
	
	public List<LevelVO> getLevelList();

	public int insertLevel(LevelVO level);

	public int updateLevel(LevelVO level);
	
	public int countLevel();
}

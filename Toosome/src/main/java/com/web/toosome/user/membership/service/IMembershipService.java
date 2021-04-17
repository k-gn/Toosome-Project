package com.web.toosome.user.membership.service;

import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipService {

	// 멤버쉽 등록
	public int registerMembership(Integer id);

	// 멤버쉽 조회
	public MembershipVO getMembershipInfo(Integer id);

	// 멤버쉽 등급업
	public int upLevel(MembershipVO vo);
}

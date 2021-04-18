package com.web.toosome.user.membership.dao;

import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipMapper {

	// 멤버쉽 등록
	public int registerMembership(Integer id);
	
	// 멤버쉽 조회
	public MembershipVO getMembershipInfo(Integer id);
	
	// 멤버쉽 등급업
	public int upLevel(MembershipVO vo);
	
	// 회원 누적금액 수정
	public int updatePayment();
	
	// 적립금액 포인트 누적
	public int updatePoint();
}

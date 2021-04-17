package com.web.toosome.user.membership.dao;

import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipMapper {

	// 멤버쉽 등록
	public int registerMembership(Integer id);
	
	// 멤버쉽 조회
	public MembershipVO getMembershipInfo(Integer id);
	
	// 멤버쉽 등급업
	public int upLevel(MembershipVO vo);
	
	// 적립금액 포인트 누적
	public int updatePoint();
	
	// 현재 포인트 조회
	
	// 등급 등록 또는 수정
	
	// 적립률 또는 할인률 수정
	
	// 포인트 차감
	
}

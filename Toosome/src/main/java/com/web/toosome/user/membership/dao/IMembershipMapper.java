package com.web.toosome.user.membership.dao;

import java.util.List;
import java.util.Map;

import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipMapper {

	// 멤버쉽 등록
	public int registerMembership(Integer id);
	
	// 멤버쉽 조회
	public MembershipVO getMembershipInfo(Integer id);
	
	// 멤버쉽 등급업
	public int upLevel(MembershipVO vo);
	
	// 등급 정보 조회
	public List<LevelVO> getLevelInfo();
	
	// 포인트 누적
	public int updatePoint(Map<String, Integer> map);
	
	// 포인트 차감
	public int deductionPoint(Map<String, Integer> map);
	
}

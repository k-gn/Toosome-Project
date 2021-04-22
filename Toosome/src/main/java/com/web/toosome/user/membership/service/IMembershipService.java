package com.web.toosome.user.membership.service;

import java.util.List;
import java.util.Map;

import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipService {

	// 멤버쉽 등록
	public int registerMembership(Integer id);

	// 멤버쉽 조회
	public MembershipVO getMembershipInfo(Integer id);

	// 멤버쉽 등급업
	public int upLevel(MembershipVO vo);

	// 전체 등급 정보 조회
	public List<LevelVO> getLevelInfo();

	public void getStackPoint(Map<String, Integer> map);
	
	public void getDownPoint(Map<String, Integer> map);
}

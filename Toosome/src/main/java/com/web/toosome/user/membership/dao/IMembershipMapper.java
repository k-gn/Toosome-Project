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
	
	// 전체 등급 정보 조회
	public List<LevelVO> getLevelInfo();
	
	// 멤버쉽 삭제
	public void deleteMembership(Integer id);
	
	// 메뉴 포인트 적립.
	public void getStackPoint(Map<String, Integer> map);
	
	//메뉴 포인트 사용.
	public void getDownPoint(Map<String, Integer> map);
}

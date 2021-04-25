package com.web.toosome.admin.memberManagement.service;

import java.util.List;

import com.web.toosome.admin.memberManagement.vo.WithdrawVO;
import com.web.toosome.user.member.vo.MemberSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberManageService {

	public List<MemberVO> getMemberList(MemberSearchVO search);

	public MemberVO getMember(Integer id);
	
	public int updateMember(MemberVO member);
	
	public List<WithdrawVO> getOutList(MemberSearchVO search);
}

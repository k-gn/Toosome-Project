package com.web.toosome.admin.memberManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.memberManagement.dao.IMemberManageMapper;
import com.web.toosome.admin.memberManagement.vo.WithdrawVO;
import com.web.toosome.user.member.vo.MemberSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

@Service
public class MemberManageService implements IMemberManageService {
	
	@Autowired
	private IMemberManageMapper mapper;

	@Override
	public List<MemberVO> getMemberList(MemberSearchVO search) {
		return mapper.getMemberList(search);
	}

	@Override
	public MemberVO getMember(Integer id) {
		return mapper.getMember(id);
	}

	@Override
	public int updateMember(MemberVO member) {
		return mapper.updateMember(member);
	}

	@Override
	public List<WithdrawVO> getOutList(MemberSearchVO search) {
		return mapper.getOutList(search);
	}

	@Override
	public WithdrawVO getOutMember(Integer id) {
		return mapper.getOutMember(id);
	}

	@Override
	public int delOutMember(String email) {
		return mapper.delOutMember(email);
	}

}

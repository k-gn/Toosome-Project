package com.web.toosome.admin.memberManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.memberManagement.dao.IMemberManageMapper;
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

}

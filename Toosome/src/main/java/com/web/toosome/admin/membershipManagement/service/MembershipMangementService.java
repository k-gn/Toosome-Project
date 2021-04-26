package com.web.toosome.admin.membershipManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.membershipManagement.dao.IMembershipManagementMapper;
import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.user.membership.vo.MembershipVO;

@Service
public class MembershipMangementService implements IMembershipManagementService {

	@Autowired
	private IMembershipManagementMapper mapper;
	
	@Override
	public List<MembershipVO> getMembershipMember(MembershipSearchVO search) {
		return mapper.getMembershipMember(search);
	}
	

}

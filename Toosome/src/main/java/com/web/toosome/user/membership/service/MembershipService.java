package com.web.toosome.user.membership.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.membership.dao.IMembershipMapper;
import com.web.toosome.user.membership.vo.MembershipVO;

@Service
public class MembershipService implements IMembershipService {
	
	@Autowired
	private IMembershipMapper mapper;

	@Override
	public int registerMembership(Integer id) {
		return mapper.registerMembership(id);
	}
	
	@Override
	public MembershipVO getMembershipInfo(Integer id) {
		return mapper.getMembershipInfo(id);
	}

	@Override
	public int upLevel(MembershipVO vo) {
		return mapper.upLevel(vo);
	}

}

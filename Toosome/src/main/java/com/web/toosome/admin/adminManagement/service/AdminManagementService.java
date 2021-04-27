package com.web.toosome.admin.adminManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.adminManagement.dao.IAdminManagementMapper;
import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

@Service
public class AdminManagementService implements IAdminManagementService{
	
	@Autowired
	private IAdminManagementMapper mapper;

	@Override
	public List<MemberVO> getAdminList(AdminSearchVO search) {
		return mapper.getAdminList(search);
	}

	
}

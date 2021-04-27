package com.web.toosome.admin.adminManagement.service;

import java.util.List;

import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

public interface IAdminManagementService {
	
	public List<MemberVO> getAdminList(AdminSearchVO search);
	
}

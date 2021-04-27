package com.web.toosome.admin.adminManagement.dao;

import java.util.List;

import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.user.member.vo.MemberVO;

public interface IAdminManagementMapper {

	// 관리자 목록 조회
	public List<MemberVO> getAdminList(AdminSearchVO search);
	
}

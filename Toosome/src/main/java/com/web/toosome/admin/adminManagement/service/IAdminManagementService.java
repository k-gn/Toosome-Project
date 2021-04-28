package com.web.toosome.admin.adminManagement.service;

import java.util.List;
import java.util.Map;

import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.admin.adminManagement.vo.AdminVO;
import com.web.toosome.user.member.vo.MemberVO;

public interface IAdminManagementService {

	public List<MemberVO> getAdminList(AdminSearchVO search);

	public boolean passwordCheck(AdminVO admin);

	public int changePassword(AdminVO admin);

	public MemberVO getAdmin(Integer id);

	public int updateAdmin(AdminVO admin);

	public int deleteAdmin(AdminVO admin);
}

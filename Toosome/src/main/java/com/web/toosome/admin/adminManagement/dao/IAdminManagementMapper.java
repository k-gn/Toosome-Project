package com.web.toosome.admin.adminManagement.dao;

import java.util.List;
import java.util.Map;

import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.admin.adminManagement.vo.AdminVO;
import com.web.toosome.user.member.vo.MemberVO;

public interface IAdminManagementMapper {

	// 관리자 목록 조회
	public List<MemberVO> getAdminList(AdminSearchVO search);

	// 아이디로 비밀번호 찾기 (비밀번호 체크용)
	public String passwordCheck(AdminVO admin);

	// 비밀번호 변경
	public int changePassword(AdminVO admin);
}

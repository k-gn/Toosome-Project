package com.web.toosome.admin.adminManagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.adminManagement.dao.IAdminManagementMapper;
import com.web.toosome.admin.adminManagement.vo.AdminSearchVO;
import com.web.toosome.admin.adminManagement.vo.AdminVO;
import com.web.toosome.user.member.vo.MemberVO;

@Service
public class AdminManagementService implements IAdminManagementService{
	
	@Autowired
	private IAdminManagementMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public List<MemberVO> getAdminList(AdminSearchVO search) {
		return mapper.getAdminList(search);
	}

	@Override
	public boolean passwordCheck(AdminVO admin) {
		boolean flag = false;
		String dbpassword = mapper.passwordCheck(admin);
		if(bCryptPasswordEncoder.matches(admin.getAdminPwd(), dbpassword)) {
			flag = true;
			return flag;
		}else {
			return flag;
		}
	}

	@Override
	public int changePassword(AdminVO admin) {
		String password = bCryptPasswordEncoder.encode(admin.getAdminNewPwd());
		admin.setAdminNewPwd(password);
		return mapper.changePassword(admin);
	}

	
}

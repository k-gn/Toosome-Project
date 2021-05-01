package com.web.toosome.admin.menuManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.menuManagement.dao.IMenuManagementMapper;
import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.user.menu.vo.MenuVO;

@Service
public class MenuManagementService implements IMenuManagementService {
	
	@Autowired
	private IMenuManagementMapper mapper;

	@Override
	public List<MenuVO> getMenuList(MenuSearchVO menu) {
		return mapper.getMenuList(menu);
	}

	@Override
	public MenuVO getMenu(Integer id) {
		return mapper.getMenu(id);
	}
	

}

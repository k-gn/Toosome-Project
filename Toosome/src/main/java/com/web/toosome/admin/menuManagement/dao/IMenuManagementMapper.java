package com.web.toosome.admin.menuManagement.dao;

import java.util.List;

import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuManagementMapper {

	// 메뉴 목록 조회
	public List<MenuVO> getMenuList(MenuSearchVO menu);
	
	// 메뉴 상세 조회
	public MenuVO getMenu(Integer id);
}

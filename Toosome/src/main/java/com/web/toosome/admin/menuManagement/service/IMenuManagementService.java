package com.web.toosome.admin.menuManagement.service;

import java.util.List;

import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.user.menu.vo.IatVO;
import com.web.toosome.user.menu.vo.MenuImageVO;
import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuManagementService {

	public List<MenuVO> getMenuList(MenuSearchVO menu);

	public MenuVO getMenu(Integer id);

	public int addMenu(MenuVO menu);

}

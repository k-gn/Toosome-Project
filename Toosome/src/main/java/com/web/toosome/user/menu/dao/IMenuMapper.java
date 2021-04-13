package com.web.toosome.user.menu.dao;

import java.util.List;

import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuMapper {
	public List<MenuVO> getbeverageList(MenuVO menuVO);
}

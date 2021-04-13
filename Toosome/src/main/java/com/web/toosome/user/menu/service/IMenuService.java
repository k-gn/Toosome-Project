package com.web.toosome.user.menu.service;

import java.util.List;

import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuService {
	public List<MenuVO> getnewList(MenuVO menuVO);
	public List<MenuVO> getbeverageList(MenuVO menuVO);
	public List<MenuVO> getdelhiList(MenuVO menuVO);
	public List<MenuVO> getdessertList(MenuVO menuVO);
	public List<MenuVO> getwholecaketList(MenuVO menuVO);
}

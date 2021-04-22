package com.web.toosome.user.menu.dao;

import java.util.List;

import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuMapper {
	public List<MenuVO> getnewList(MenuVO menuVO);
	public List<MenuVO> getbeverageList(MenuVO menuVO);
	public List<MenuVO> getdelhiList(MenuVO menuVO);
	public List<MenuVO> getdessertList(MenuVO menuVO);
	public List<MenuVO> getwholecaketList(MenuVO menuVO);
	
	
	public MenuVO getnewDetail(MenuVO menuVO);
	public MenuVO getbeverageDetail(MenuVO menuVO);
	public MenuVO getdelhiDetail(MenuVO menuVO);
	public MenuVO getdessertDetail(MenuVO menuVO);
	public MenuVO getwholecakeDetail(MenuVO menuVO);
	public MenuVO getimportList(MenuVO menuVO);
	
	public List<MenuVO> getIatListOne(MenuVO vo);
	public List<MenuVO> getSearchIatListOne(MenuVO vo);
	
	public List<MenuVO> getIatListTwo(MenuVO vo);
	public List<MenuVO> getSearchIatListTwo(MenuVO vo);
	
	public List<MenuVO> getIatListThree(MenuVO vo);
	public List<MenuVO> getSearchIatListThree(MenuVO vo);
	
	public List<MenuVO> getIatListFour(MenuVO vo);
	public List<MenuVO> getSearchIatListFour(MenuVO vo);

	
}

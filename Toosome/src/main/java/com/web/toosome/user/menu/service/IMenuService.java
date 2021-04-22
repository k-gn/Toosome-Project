package com.web.toosome.user.menu.service;

import java.util.List;

import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuService {
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
	
	//영양성분표 리스트 1
	public List<MenuVO> getIatListOne(MenuVO vo);
	
	//영양성분표 리스트 1 검색
	public List<MenuVO> getSearchIatListOne(MenuVO vo);
	
	//영양성분표 리스트 2
	public List<MenuVO> getIatListTwo(MenuVO vo);
	
	//영양성분표 리스트 2 검색
	public List<MenuVO> getSearchIatListTwo(MenuVO vo);
	
	//영양성분표 리스트3
	public List<MenuVO> getIatListThree(MenuVO vo);
	
	//영양성분표 리스트3 검색
	public List<MenuVO> getSearchIatListThree(MenuVO vo);
	
	//영양성분표 리스트4
	public List<MenuVO> getIatListFour(MenuVO vo);
	
	//영양성분표 리스트4 검색
	public List<MenuVO> getSearchIatListFour(MenuVO vo);
}

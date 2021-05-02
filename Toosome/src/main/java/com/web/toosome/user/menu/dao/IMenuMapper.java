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

	// 기프트콘 구매 후 주문 내역 orders 테이블에 저장.
	public int saveGift(MenuVO vo);
	
	// 기프트콘 구매 후 주문 내역 orders 테이블에 저장할 때 메뉴이름 얻어오기
	public String getMenuMainTitle(Integer id);

	// orderDetail 데이터 만들기.
	public int giftSendOrder(MenuVO vo);
	
}

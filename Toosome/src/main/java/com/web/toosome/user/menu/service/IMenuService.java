package com.web.toosome.user.menu.service;

import java.util.List;

import com.web.toosome.user.menu.vo.MenuImageVO;
import com.web.toosome.user.menu.vo.MenuReviewBoardVO;
import com.web.toosome.user.menu.vo.MenuVO;
import com.web.toosome.user.product.vo.ProductReviewBoardVO;

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
	
	//별점 평균값
	public MenuVO menuRatingAVG(MenuVO menuVO);
	
	// 댓글 조회
	public List<MenuReviewBoardVO> menuReviewList(Integer menuId);
		
	// 댓글 작성
	public int menuReviewInsert(MenuReviewBoardVO menuReviewBoardVO);

	// 댓글 수정
	public int menuReviewUpdate(MenuReviewBoardVO menuReviewBoardVO);

	// 댓글 삭제
	public int menuReviewDelete(MenuReviewBoardVO menuReviewBoardVO);
	
	// 정보조회
	public MenuReviewBoardVO menuReviewSelect(Integer menuReviewBoardId);

	//회원 댓글 삭제
	public int delmenuById(Integer id);
	
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
	
	// 기프트콘 구매 후 주문 내역 orders 테이블에 저장.
	public int saveGift(MenuVO vo);
	
	// 기프트콘 구매 후 주문 내역 orders 테이블에 저장할 때 메뉴이름 얻어오기
	public String getMenuMainTitle(Integer id);
	
	// orderDetail 데이터 만들기.
	public int giftSendOrder(MenuVO vo);
	
	// menuid 하나 받아서 이미지 경로 생성
	public MenuImageVO getMenuImagePath(Integer id);
	
	// memberId 최신순으로 정렬 후 ordersId 가져오기
	public int getOrdersId(Integer id);
		
	// 메뉴 가격 가져오기
	public int getMenuPrice(Integer id);
				
}

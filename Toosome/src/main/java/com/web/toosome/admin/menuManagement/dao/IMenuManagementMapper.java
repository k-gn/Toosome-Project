package com.web.toosome.admin.menuManagement.dao;

import java.util.List;

import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.user.menu.vo.IatVO;
import com.web.toosome.user.menu.vo.MenuImageVO;
import com.web.toosome.user.menu.vo.MenuVO;

public interface IMenuManagementMapper {

	// 메뉴 목록 조회
	public List<MenuVO> getMenuList(MenuSearchVO menu);
	
	// 메뉴 상세 조회
	public MenuVO getMenu(Integer id);
	
	// 메뉴 등록
	public int addMenu(MenuVO menu);
	public int addMenuImage(MenuImageVO menu);
	
	// 영양성분표 등록
	public int addIat(IatVO iat);
	
	// 메뉴 수정
	public int modMenu(MenuVO menu);
	public int modMenuImage(MenuImageVO menu);
	
	// 메뉴 삭제
	public int delMenu(MenuVO menu);
	public int delMenuImage(Integer id);
	
	// 영양성분표 삭제
	public int delIat(Integer id);

	// 메뉴 인덱스
	public int getMenuIndex();
	
	// AI 초기화
	public void aiReset();
}

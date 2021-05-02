package com.web.toosome.admin.menuManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.toosome.admin.menuManagement.dao.IMenuManagementMapper;
import com.web.toosome.admin.menuManagement.vo.MenuSearchVO;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.menu.vo.IatVO;
import com.web.toosome.user.menu.vo.MenuImageVO;
import com.web.toosome.user.menu.vo.MenuVO;

@Service
public class MenuManagementService implements IMenuManagementService {
	
	private final String[] menuPath = {"img/beverage", "img/dessert", "img/delhi", "img/wholecake"};
	
	@Autowired
	private IMenuManagementMapper mapper;
	
	@Autowired
	private S3Service s3;
	
	@Override
	public List<MenuVO> getMenuList(MenuSearchVO menu) {
		return mapper.getMenuList(menu);
	}

	@Override
	public MenuVO getMenu(Integer id) {
		MenuVO menu = mapper.getMenu(id);
		MenuImageVO image = menu.getMenuImageVO();
		if(image != null) {
			menu.setMenuImagePath(image.getMenuImageRoute() + "/" + image.getMenuImageName() + "." + image.getMenuImageExtention());
		}else {
			menu.setMenuImagePath("img/pages/admin/subpages/setting/blank.png");
		}
		return menu;
	}

	@Transactional
	@Override
	public int addMenu(MenuVO menu) {
		mapper.aiReset();
		int index = mapper.getMenuIndex();
		int result = mapper.addMenu(menu);
		
		IatVO iat = menu.getIatVO();
		iat.setMenuMenuId(index);
		
		MenuImageVO menuImage = menu.getMenuImageVO();
		menuImage.setMenuMenuId(index);
		
		String[] menuImageName = menu.getFile().getOriginalFilename().split("\\.");
		System.out.println(menuImageName);
		int pathNum = Integer.parseInt(menu.getMenuType()) - 1;
		menuImage.setMenuImageRoute(menuPath[pathNum]);
		menuImage.setMenuImageName(menuImageName[0]);
		menuImage.setMenuImageExtention(menuImageName[1]);
		System.out.println(menuImage);

		mapper.addIat(iat);
		mapper.addMenuImage(menuImage);
		s3.upload(menu.getFile(), menuPath[pathNum] + "/");
		
		return result;
	}

	@Transactional
	@Override
	public int modMenu(MenuVO menu) {
		
		MenuImageVO menuImage = menu.getMenuImageVO();
		menuImage.setMenuMenuId(menu.getMenuId());
		int result = mapper.modMenu(menu);
		int pathNum = Integer.parseInt(menu.getMenuType()) - 1;
		String[] menuImageNames = menu.getFile().getOriginalFilename().split("\\.");
		String[] oldImageNames = menu.getOldImageName().substring(menu.getOldImageName().lastIndexOf("/") + 1).split("\\.");
		
		String menuImageName = "";
		if(menu.getFile() != null) {
			menuImageName = menu.getFile().getOriginalFilename();
		}
		
		if(!menu.getMenuType().equals(menu.getOldCategory()) && menuImageName.equals("")) {
			s3.copy(menu.getOldImageName(), menuPath[pathNum] + "/" + menu.getOldImageName().substring(menu.getOldImageName().lastIndexOf("/") + 1));
			s3.delete(menu.getOldImageName());
			
			menuImage.setMenuImageRoute(menuPath[pathNum]);
			menuImage.setMenuImageName(oldImageNames[0]);
			menuImage.setMenuImageExtention(oldImageNames[1]);
			mapper.modMenuImage(menuImage);
		}
		
		if(!menuImageName.equals("")) {
			s3.delete(menu.getOldImageName());
			s3.upload(menu.getFile(), menuPath[pathNum] + "/");
			
			menuImage.setMenuImageRoute(menuPath[pathNum]);
			menuImage.setMenuImageName(menuImageNames[0]);
			menuImage.setMenuImageExtention(menuImageNames[1]);
			mapper.modMenuImage(menuImage);
		}
		
		return result;
	}

	@Transactional
	@Override
	public int delMenu(MenuVO menu) {
		mapper.delIat(menu.getMenuId());
		mapper.delMenuImage(menu.getMenuId());
		int result = mapper.delMenu(menu);
		s3.delete(menu.getOldImageName());
		return result;
	}
	

}

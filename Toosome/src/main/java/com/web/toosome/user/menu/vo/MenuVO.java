package com.web.toosome.user.menu.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MenuVO {
	private Integer menuId;
	private String menuMainTitle;
	private String menuSubTitle;
	private String menuContent;
	private Integer menuPrice;
	private String menuType;
	private Date menuRegDate;
	private Date menuStartDay;
	private Integer menuCheckCount;
	private Integer menuState;
	private Integer menuNew;
	private MenuImageVO menuImageVO;
	private IatVO iatVO;
	
}

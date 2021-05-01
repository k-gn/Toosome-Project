package com.web.toosome.user.menu.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MenuVO {
	private Integer menuId;
	private String menuMainTitle;
	private String menuSubTitle;
	private String menuContent;
	private int menuPrice;
	private String menuType;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date menuRegDate;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date menuStartDay;
	private Integer menuCheckCount;
	private Integer menuState;
	private Integer menuNew;
	private MenuImageVO menuImageVO;
	private IatVO iatVO;
	private String keyword;
	/*
	 * private Integer menusalt; private Integer menuEndPrice;
	 */
	
	
}

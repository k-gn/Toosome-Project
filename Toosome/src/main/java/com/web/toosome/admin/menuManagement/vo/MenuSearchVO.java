package com.web.toosome.admin.menuManagement.vo;

import lombok.Data;

@Data
public class MenuSearchVO {

	private String condition;
	private String keyword;
	private Integer category;
	private Integer type;
	private Integer state;
}

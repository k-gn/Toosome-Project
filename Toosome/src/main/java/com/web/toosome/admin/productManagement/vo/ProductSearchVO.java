package com.web.toosome.admin.productManagement.vo;

import lombok.Data;

@Data
public class ProductSearchVO {

	private String condition;
	private String keyword;
	private Integer category;
	private Integer type;
	private Integer state;
}

package com.web.toosome.user.product.vo;

import lombok.Data;

@Data
public class ProductPrecautionsVO {
	private Integer productPrecautionsId; //주의사항 ID
	private String productPrecautionsTitle; // 주의사항 제목
	private String productPrecautionsContent; // 주의사항 내용
	private String productPrecautionsContentName1; // 주의사항 이름1
	private String productPrecautionsContent1; //주의사항 이름의 내용1
	private String productPrecautionsContentName2; //주의사항 이름2
	private String productPrecautionsContent2; //주의사항 이름의 내용2
	private String productPrecautionsContentName3; //주의사항 이름 3
	private String productPrecautionsContent3; //주의사항 이름의 내용3
	private String productPrecautionsOnoff; //주의사항 
}

package com.web.toosome.user.product.vo;

import lombok.Data;

@Data
public class ProductScoreVO {
	private Integer scoreImageId;
	private String scoreImageName;
	private String scoreImageExtention;
	private String scoreImageRoute;
	private Integer scoreImageOnoff;
	private ProductVO productVO;
}

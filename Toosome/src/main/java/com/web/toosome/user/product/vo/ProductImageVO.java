package com.web.toosome.user.product.vo;

import lombok.Data;

@Data
public class ProductImageVO {
	private Integer productImageId; //상품이미지 ID
	private Integer productProductId; // 상품 ID
	private String productImageName; // 상품이미지 이름
	private String productImageExtention; // 상품 이미지 확장자
	private String productImageRoute; //상품 이미지 경로
}

package com.web.toosome.user.basket.vo;

import java.util.List;

import com.web.toosome.user.product.vo.ProductImageVO;
import com.web.toosome.user.product.vo.ProductVO;

import lombok.Data;

@Data
public class BasketVO {
	private Integer basketId;
	private Integer memberId;
	private Integer productId;
	private Integer productImageId;
	private Integer basketAmount;
	private String basketName;
	private Integer basketPrice;
	private ProductImageVO productImageVO;
}

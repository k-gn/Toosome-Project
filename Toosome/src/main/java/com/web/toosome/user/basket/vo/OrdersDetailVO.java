package com.web.toosome.user.basket.vo;

import lombok.Data;

@Data
public class OrdersDetailVO {
	private Integer ordersDetailId;
	private Integer ordersId;
	private Integer memberId;
	private Integer productId;
	private Integer productImageId;
	private Integer ordersDetailAmount;
	private String ordersDetailName;
	private Integer ordersDetailPrice;
}

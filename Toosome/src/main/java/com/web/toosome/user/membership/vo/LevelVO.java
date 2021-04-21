package com.web.toosome.user.membership.vo;

import lombok.Data;

@Data
public class LevelVO {

	private Integer levelId;
	private Integer levelDiscountRate;
	private Integer levelCount;
	private Integer levelMinRange;
	private Integer levelMaxRange;
	private Integer levelPointRate;
	private Integer levelDeliveryPay;
	private String levelImg;
	private String levelName;
}

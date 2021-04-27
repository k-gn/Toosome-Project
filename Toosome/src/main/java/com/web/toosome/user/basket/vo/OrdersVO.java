package com.web.toosome.user.basket.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersVO {
	private Integer ordersId;
	private Integer memberId;
	private Date ordersOrderDate;
	private Integer ordersPayment;
	private String ordersState;
	private String ordersAddress;
	private String ordersPostcode;
	private String ordersReceiver;
	private Integer ordersDelivery;
	private String ordersPhone;
	private String ordersContent;
}

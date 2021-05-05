package com.web.toosome.user.basket.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.web.toosome.user.member.vo.MemberVO;

import lombok.Data;

@Data
public class OrdersCancelVO {
	private Integer ordersId;
	private Integer memberId;
	private String ordersProductName;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date ordersOrderDate;
	private Date ordersCancelOrderDate;
	private Integer ordersPayment;
	private String ordersState;
	private String ordersAddress;
	private String ordersPostcode;
	private String ordersReceiver;
	private Integer ordersDelivery;
	private String ordersPhone;
	private String ordersContent;
	private String ordersMerchantUid;
	private Integer ordersAmount;
	private String ordersMemberEmail;
	private Integer ordersUsePoint;
	private Integer ordersProductPay;
	private Integer ordersSal;	
	
	private MemberVO memberVO;
}

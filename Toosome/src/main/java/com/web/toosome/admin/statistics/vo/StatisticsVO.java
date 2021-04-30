package com.web.toosome.admin.statistics.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class StatisticsVO {
	
	private Integer orderId;
	private String memberEmail;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date orderDate;
	private Integer payment;
	private String startStatisticsDate;
	private String endStatisticsDate;

}

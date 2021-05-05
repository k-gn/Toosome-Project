package com.web.toosome.admin.orderManagement.vo;

import lombok.Data;

@Data
public class OrderCancelManagementVO {
	private String condition;
	private String keyword;
	private String startDate;
	private String endDate;
	private String cancelstartDate;
	private String cancelendDate;

}

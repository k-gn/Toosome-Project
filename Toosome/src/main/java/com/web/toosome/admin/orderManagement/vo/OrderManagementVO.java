package com.web.toosome.admin.orderManagement.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class OrderManagementVO {
	private String condition;
	private String keyword;
	private String startDate;
	private String endDate;
	private List<String> orderState;
}

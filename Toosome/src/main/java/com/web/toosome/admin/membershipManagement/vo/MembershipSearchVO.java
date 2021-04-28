package com.web.toosome.admin.membershipManagement.vo;

import lombok.Data;

@Data
public class MembershipSearchVO {

	public String condition;
	public String keyword;
	public String memberLevel;
	public String startDate;
	public String endDate;
}

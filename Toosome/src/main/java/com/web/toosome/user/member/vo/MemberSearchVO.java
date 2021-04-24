package com.web.toosome.user.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberSearchVO{
	
	private String condition;
	private String platFormType;
	private Date startRegDate;
	private Date endRegDate;
	private Date startLoginDate;
	private Date endLoginDate;
}
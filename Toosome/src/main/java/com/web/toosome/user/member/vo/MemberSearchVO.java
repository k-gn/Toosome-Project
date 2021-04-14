package com.web.toosome.user.member.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberSearchVO{
	
	private String memberName;
	private String memberEmail;
	private String platFormType;
	private Date startRegDate;
	private Date endRegDate;
	private Date startLoginDate;
	private Date endLoginDate;
}
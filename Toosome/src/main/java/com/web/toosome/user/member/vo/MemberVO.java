package com.web.toosome.user.member.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private Integer memberId;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private Date memberBirth;
	private String memberPhone;
	private String memberAddress;
	private String platFormType;
	private Date regDate;
	private Integer status;
	private Date lastLoginDate;
	private Integer memberRePassword;
	private List<AuthVO> authList;
	
}
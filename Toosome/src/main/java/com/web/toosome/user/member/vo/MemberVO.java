package com.web.toosome.user.member.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberVO{
	
	private Integer memberId;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date memberBirth;
	private String memberPhone;
	private String memberAddress;
	private String memberPostcode;
	private String platFormType;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date regDate;
	private Integer status;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date lastLoginDate;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date memberStatusDate;
	private Integer memberRePassword;
	private List<AuthVO> authList;
}
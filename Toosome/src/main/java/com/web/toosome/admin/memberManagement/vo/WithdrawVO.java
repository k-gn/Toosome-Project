package com.web.toosome.admin.memberManagement.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class WithdrawVO {

	private Integer withdrawId;
	private String withdrawName;
	private String withdrawEmail;
	private String withdrawPassword;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date withdrawBirth;
	private String withdrawPhone;
	private String withdrawAddress;
	private String withdrawPostcode;
	private String platFormType;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date regDate;
	private Integer status;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date withdrawDate;
}

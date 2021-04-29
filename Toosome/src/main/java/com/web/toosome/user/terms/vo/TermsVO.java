package com.web.toosome.user.terms.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TermsVO {
	private Integer termsId;
	private String termsTitle ;
	private String termsContent;
	private Integer termsNecessary;
	private Date termsRegDate;
	private Date termsExpireDate;
	private Date termsChangeDate;
	
}

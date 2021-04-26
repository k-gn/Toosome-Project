package com.web.toosome.admin.mainManagement.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DailyVO {

	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM", timezone="Asia/Seoul")
	private Date daily;
	private Integer visit;
}

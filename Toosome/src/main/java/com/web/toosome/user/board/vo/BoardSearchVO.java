package com.web.toosome.user.board.vo;

import lombok.Data;

@Data
public class BoardSearchVO {
	
	private String condition;
	private String keyword;
	private String startRegDate;
	private String endRegDate;

}

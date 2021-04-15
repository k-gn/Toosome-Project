package com.web.toosome.user.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class EventBoardDetailVO {
	
	private Integer eventBoardDetailId;
	private String eventBoardDetailImageRoute;
	private String eventBoardDetailImageName;
	private String eventBoardDetailImageExtention;
	private Date eventBoardDetailDay; //글작성날짜
	
}

package com.web.toosome.user.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class EventBoardVO {
	
	private Integer eventBoardId;
	private String eventBoardImageRoute;
	private String eventBoardImageName;
	private String eventBoardImageExtention;
	private String eventBoardViewCount;
	private String eventBoardTitle;
	private Date eventBoardStartday;
	private Date eventBoardEndday;
	private EventBoardDetailVO eventBoardDetailVO;
	

}

package com.web.toosome.user.board.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EventBoardVO {
	
	private Integer eventBoardId;
	private String eventBoardImageRoute;
	private String eventBoardImageName;
	private String eventBoardImageExtention;
	private String eventBoardViewCount;
	private String eventBoardTitle;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date eventBoardStartday;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date eventBoardEndday;
	private EventBoardDetailVO eventBoardDetailVO;
	private MultipartFile uploadFile;
	

}

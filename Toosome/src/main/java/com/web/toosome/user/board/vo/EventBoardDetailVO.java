package com.web.toosome.user.board.vo;

import java.sql.Date;

import javax.swing.plaf.multi.MultiProgressBarUI;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EventBoardDetailVO {
	
	private Integer eventBoardDetailId;
	private String eventBoardDetailImageRoute;
	private String eventBoardDetailImageName;
	private String eventBoardDetailImageExtention;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date eventBoardDetailDay; //글작성날짜
	private MultipartFile uploadFile2;
}

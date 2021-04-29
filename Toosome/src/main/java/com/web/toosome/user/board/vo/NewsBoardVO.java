package com.web.toosome.user.board.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NewsBoardVO {
	private Integer newsBoardId;
	private String newsBoardImageRoute;
	private String newsBoardImageName;
	private String newsBoardImageExtention;
	private String newsBoardViewCount;
	private String newsBoardTitle;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date newsBoardRegdate;
	private NewsBoardDetailVO newsBoardDetailVO;

}

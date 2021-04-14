package com.web.toosome.user.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NewsBoardVO {
	private Integer newsBoardId;
	private String newsBoardImageRoute;
	private String newsBoardImageName;
	private String newsBoardImageExtention;
	private String newsBoardViewCount;
	private String newsBoardTitle;
	private Date newsBoardRegdate;
	private NewsBoardDetailVO newsBoardDetailVO;

}

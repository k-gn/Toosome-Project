package com.web.toosome.user.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NewsBoardDetailVO {
	private Integer newsBoardDetailId;
	private String newsBoardDetailImageRoute;
	private String newsBoardDetailImageName;
	private String newsBoardDetailImageExtention;
	private Integer newsBoardDetailViewCount;
	private String newsBoardDetailTitle;
	private Date newsBoardDetailRegdate;
	

}

package com.web.toosome.user.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private Integer noticeBoardId;
	private String noticeBoardTitle;
	private String noticeBoardContent;
	private Integer noticeBoardViewCount;
	private Date noticeBoardRegdate;
	

}

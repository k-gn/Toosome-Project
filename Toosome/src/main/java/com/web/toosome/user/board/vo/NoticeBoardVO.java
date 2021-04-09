package com.web.toosome.user.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private Integer noticeBoardId;
	private String noticeBoardTitle;
	private String noticeBoardContent;
	private Integer noticeBoardViewCount;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date noticeBoardRegdate;
	

}

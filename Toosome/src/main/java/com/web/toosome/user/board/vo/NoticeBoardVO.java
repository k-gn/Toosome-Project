package com.web.toosome.user.board.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private Integer noticeBoardId;
	private String noticeBoardTitle;
	private String noticeBoardContent;
	private Integer noticeBoardViewCount;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date noticeBoardRegdate;

	

}

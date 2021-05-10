package com.web.toosome.user.board.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FaqBoardVO {
	private Integer faqBoardId;
	private String faqBoardTitle;
	private String faqBoardContent;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date faqBoardRegDate;
}

package com.web.toosome.user.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaBoardVO {
	
	private Integer qnaBoardId;
	private Integer memberMemberId;
	private Integer qnaBoardType;
	private String qnaBoardTitle;
	private String qnaBoardContent;
	private Date qnaBoardRegdate;
	private Integer qnaBoardViewCount;
	private String qnaBoardPassword;
	private Integer qnaBoardSortRef;
	private Integer qnaBoardSortStep;
	private Integer qnaBoardSortDepth;
	private String qnaBoardImageRoute;
	
}

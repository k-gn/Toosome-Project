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
	private String qnaBoardImageRoute;
	private Integer qnaBoardSecret; 
	// 비밀글 일시 참(1) 아닐시 거짓(0) 디폴트 값 (0)
	
}
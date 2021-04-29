package com.web.toosome.user.board.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.web.toosome.user.member.vo.MemberVO;

import lombok.Data;

@Data
public class QnaBoardCommentVO {
	
	private Integer qnaBoardCommentId;
	private Integer	memberMemberId;
	private Integer qnaBoardId;
	
	private String qnaBoardCommentTitle;
	private String qnaBoardCommentContent;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date qnaBoardCommentDay;
	private QnaBoardVO qnaBoard;
	private MemberVO member;
}

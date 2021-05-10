package com.web.toosome.user.board.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.web.toosome.user.member.vo.MemberVO;
import lombok.Data;

@Data
public class QnaBoardVO {
	
	private Integer qnaBoardId;
	private Integer memberMemberId;
	private Integer qnaBoardType;
	private String qnaBoardTitle;
	private String qnaBoardContent;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date qnaBoardRegdate;
	private Integer qnaBoardViewCount;
	private String qnaBoardPassword;
	private String qnaBoardImageName;
	private Integer qnaBoardSecret; // 비밀글 일시 참(1) 아닐시 거짓(0) 디폴트 값 (0) 
	private MultipartFile uploadFile;
	private boolean qnaBoardConfirm; //기본값 false
	private List<QnaBoardCommentVO> qnaBoardComment;
	private List<MemberVO> member;
	
}

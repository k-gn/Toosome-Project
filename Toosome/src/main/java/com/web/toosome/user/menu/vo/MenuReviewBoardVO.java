package com.web.toosome.user.menu.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class MenuReviewBoardVO {
	private Integer menuReviewBoardId; //리뷰 아이디
	private	Integer menuId;//메뮤 아이디
	private Integer memberId;//멤버 아이디
	
	private Integer menuReviewBoardRating; //별점
	private String menuReviewBoardContent; //댓글 내용
	private String menuReviewBoardWriter;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date menuReviewBoardRegDate; // 댓글 작성 시간
	

	
		
}

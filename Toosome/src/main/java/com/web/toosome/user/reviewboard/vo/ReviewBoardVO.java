package com.web.toosome.user.reviewboard.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewBoardVO {
	private Integer reviewBoardId; //리뷰 아이디
	private	Integer productId;//상품 아이디
	private	Integer menuId;//상품 아이디
	private Integer memberId;//멤버 아이디
	
	private Integer reviewBoardRating; //별점
	private String reviewBoardContent; //댓글 내용
	private String reviewBoardWriter;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date reviewBoardRegDate; // 댓글 작성 시간

	
		
}

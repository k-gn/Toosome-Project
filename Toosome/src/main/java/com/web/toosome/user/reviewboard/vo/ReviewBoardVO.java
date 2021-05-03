package com.web.toosome.user.reviewboard.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewBoardVO {
	private Integer reviewBoardId; //리뷰보드 아이디
//	private Integer memberMemberId;//멤버 아이디
	private	Integer productId;//상품 아이디
//	private Integer menuMenuId;//메뉴 아이디
	private String reviewBoardWriter; //작성자
	private String reviewBoardContent; //댓글 내용
//	private int reviewBoardRating; //별점
//	private Integer reviewBoardRefGroup;
//	private Integer reviewBoardType; // 어디 메뉴/상품에 코멘트 남겼는지 확인
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date reviewBoardRegDate; // 댓글 작성 시간
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date reviewBoardURegDate;
//	private String reviewBoardImageRoute; // 별점 이미지 경로



		
}

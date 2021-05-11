package com.web.toosome.user.product.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class ProductReviewBoardVO {
	private Integer productReviewBoardId; //리뷰 아이디
	private	Integer productId;//상품 아이디
	private Integer memberId;//멤버 아이디
	
	private Integer productReviewBoardRating; //별점
	private String productReviewBoardContent; //댓글 내용
	private String productReviewBoardWriter; // 사용자 이름
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date productReviewBoardRegDate; // 댓글 작성 시간
	

	
		
}

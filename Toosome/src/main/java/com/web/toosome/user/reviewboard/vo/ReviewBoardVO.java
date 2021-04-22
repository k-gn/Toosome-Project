package com.web.toosome.user.reviewboard.vo;

import java.util.Date;

import com.web.toosome.user.member.vo.MemberVO;
import com.web.toosome.user.menu.vo.MenuVO;
import com.web.toosome.user.product.vo.ProductVO;

import lombok.Data;
@Data
public class ReviewBoardVO {
	private Integer reviewBoardId; //리뷰보드 아이디
	private Integer memberMemberId;//멤버 아이디
	private	Integer productProductId;//상품 아이디
	private Integer menuMenuId;//메뉴 아이디
	private String reviewBoardContent; //댓글 내용
	private int reviewBoardRating; //별점
	private String reviewBoardType; // 어디 메뉴/상품에 코멘트 남겼는지 확인
	private Date reviewBoardRegDate; // 댓글 작성 시간
	private String reviewBoardImageRoute; // 별점 이미지 경로
	private MemberVO memberVO;
	private ProductVO productVO;
	private MenuVO menuVO;
//	private Integer reviewBoardAsc;// 선택된 상품에 맞는 리뷰만 보게하기 위함, 번호 순으로 정렬시키기
//	private Integer reviewBoardAnswer;// 어드민(관리자)가 리뷰에 댓글 달 때 사용하기 위함
}

package com.web.toosome.user.product.vo;

import java.util.Date;

import com.web.toosome.user.member.vo.MemberVO;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

import lombok.Data;

@Data
public class ProductVO {
	
	private Integer productId; //주문가능상품의 고유 번호(중복불가)
	private String productTitleName; //상품이름
	private String productSubName; //상품 서브이름
	private String productContent; //상품 설명란
	private Integer productPrice;	//상품 가격
//	private Integer productScope; //별점
	private String productType;//상품 페이지 타입\n1. 전체\n2. 커피\n3. 커피웨어\n4. 기프트세트; 
	private Date productRegDate; //상품 등록일
	private Integer productStar;
	private Integer productRemainingAmount; //상품의 재고수량
	private Integer productReceivedAmount; //상품 입고 수량
	private Integer productReceivedPrice; //상품 입고 가격
	private Integer productLimitAmount; //알람용 최소 재고량
	private Date productStartDay; //판매시작일
	private Integer productCheckCount; //상품 조회수
	private Integer productState; //상품 현재 상태\n1. 정상판매중\n2. 단종\n3. Sold out
	private Integer productNew; //신메뉴 확인\n1 이상 TRUE\n0은 FALSE
	private Integer productOnoff; //주의사항 확인\n0 은 TRUE\n1은 FALSE
	private ProductImageVO productImageVO; //상품이지미 VO
	private ProductPrecautionsVO productPrecautionsVO;//주의사항 VO
	private MemberVO memberVO;
}

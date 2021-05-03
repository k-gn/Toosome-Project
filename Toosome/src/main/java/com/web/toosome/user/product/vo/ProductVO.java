package com.web.toosome.user.product.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.web.toosome.user.member.vo.MemberVO;

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


	private Integer productStar;

	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date productRegDate; //상품 등록일

	private Integer productReceivedAmount; //상품 입고 수량
	private Integer productReceivedPrice; //상품 입고 가격
	private Integer productLimitAmount; //알람용 최소 재고량
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date productStartDay; //판매시작일
	private Integer productCheckCount; //상품 조회수
	private Integer productState; //상품 현재 상태\n1. 정상판매중\n2. 단종\n3. Sold out
	private Integer productNew; //신메뉴 확인\n1 이상 TRUE\n0은 FALSE
	private Integer productOnoff; //주의사항 확인\n0 은 TRUE\n1은 FALSE
	private ProductImageVO productImageVO; //상품이지미 VO
	private ProductPrecautionsVO productPrecautionsVO;//주의사항 VO

	private MemberVO memberVO;

//	private String searchCondition; //검색 조건
//	private String searchKeyword; //검색 키워드
	
	private MultipartFile file;
	private String oldImageName;
	private String productImagePath;

}

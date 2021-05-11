package com.web.toosome.user.product.dao;

import java.util.List;

import com.web.toosome.user.product.vo.ProductVO;
import com.web.toosome.user.menu.vo.MenuVO;
import com.web.toosome.user.product.vo.ProductReviewBoardVO;

public interface IProductMapper {
	public List<ProductVO> getproductnewList(ProductVO productVO);
	public List<ProductVO> getcoffeeList(ProductVO productVO);
	public List<ProductVO> getcoffeewearList(ProductVO productVO);
	public List<ProductVO> getgiftList(ProductVO productVO);
	public ProductVO getproductDetail(ProductVO productVO);
	public ProductVO getproductDetailById(Integer pid);
	public ProductVO getproductprecautionsDetail(ProductVO productVO);
	
	
	//별점 평균값
	public ProductVO productRatingAVG(ProductVO productVO);
	
	// 댓글 조회
	public List<ProductReviewBoardVO> productReviewList(Integer productId);
		
	// 댓글 작성
	public int productReviewInsert(ProductReviewBoardVO productReviewBoardVO);

	// 댓글 수정
	public int productReviewUpdate(ProductReviewBoardVO productReviewBoardVO);

	// 댓글 삭제
	public int productReviewDelete(ProductReviewBoardVO productReviewBoardVO);
	

}

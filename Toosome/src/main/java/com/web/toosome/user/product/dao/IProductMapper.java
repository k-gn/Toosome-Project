package com.web.toosome.user.product.dao;

import java.util.List;

import com.web.toosome.user.product.vo.ProductVO;
import com.web.toosome.user.reviewboard.vo.ReviewBoardVO;

public interface IProductMapper {
	public List<ProductVO> getproductnewList(ProductVO productVO);
	public List<ProductVO> getcoffeeList(ProductVO productVO);
	public List<ProductVO> getcoffeewearList(ProductVO productVO);
	public List<ProductVO> getgiftList(ProductVO productVO);
	public ProductVO getproductDetail(ProductVO productVO);
	public ProductVO getproductDetailById(Integer pid);
	public ProductVO getproductprecautionsDetail(ProductVO productVO);
	
	

}

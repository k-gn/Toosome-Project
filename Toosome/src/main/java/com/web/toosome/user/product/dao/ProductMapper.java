package com.web.toosome.user.product.dao;

import java.util.List;

import com.web.toosome.user.product.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getproductnewList(ProductVO productVO);
	public List<ProductVO> getallList(ProductVO productVO);
	public List<ProductVO> getcoffeeList(ProductVO productVO);
	public List<ProductVO> getcoffeewearList(ProductVO productVO);
	public List<ProductVO> getgiftList(ProductVO productVO);
	public ProductVO getproductnewDetail(ProductVO productVO);
	public ProductVO getallDetail(ProductVO productVO);
	public ProductVO getcoffeeDetail(ProductVO productVO);
	public ProductVO getcoffeewearDetail(ProductVO productVO);
	public ProductVO getgiftDetail(ProductVO productVO);
}

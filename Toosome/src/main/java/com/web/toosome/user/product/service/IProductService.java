package com.web.toosome.user.product.service;

import java.util.List;

import com.web.toosome.user.product.vo.ProductVO;

public interface IProductService {
	public List<ProductVO> getproductnewList(ProductVO productVO);
	public List<ProductVO> getcoffeeList(ProductVO productVO);
	public List<ProductVO> getcoffeewearList(ProductVO productVO);
	public List<ProductVO> getgiftList(ProductVO productVO);
	public ProductVO getproductDetail(ProductVO productVO);
	public ProductVO getproductprecautionsDetail(ProductVO productVO);
}


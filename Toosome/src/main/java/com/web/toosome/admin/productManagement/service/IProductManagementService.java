package com.web.toosome.admin.productManagement.service;

import java.util.List;

import com.web.toosome.admin.productManagement.vo.ProductSearchVO;
import com.web.toosome.user.product.vo.ProductVO;

public interface IProductManagementService {

	public List<ProductVO> getProductList(ProductSearchVO product);
	
	public ProductVO getProduct(Integer id);
	
	public int addProduct(ProductVO product);
	
	public int modProduct(ProductVO product);
	
	public int delProduct(ProductVO product);
}

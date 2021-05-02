package com.web.toosome.admin.productManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.productManagement.dao.IProductManagementMapper;
import com.web.toosome.admin.productManagement.vo.ProductSearchVO;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.product.vo.ProductVO;

@Service
public class ProductManagementService implements IProductManagementService {
	
	private final String productPath = "img/product";

	@Autowired
	private IProductManagementMapper mapper;

	@Autowired
	private S3Service s3;
	
	@Override
	public List<ProductVO> getProductList(ProductSearchVO product) {
		return mapper.getProductList(product);
	}

	@Override
	public ProductVO getProduct(Integer id) {
		return null;
	}

	@Override
	public int addProduct(ProductVO product) {
		return 0;
	}

	@Override
	public int modProduct(ProductVO product) {
		return 0;
	}

	@Override
	public int delProduct(ProductVO product) {
		return 0;
	}
}

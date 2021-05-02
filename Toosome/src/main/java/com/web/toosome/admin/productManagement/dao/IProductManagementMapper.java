package com.web.toosome.admin.productManagement.dao;

import java.util.List;

import com.web.toosome.admin.productManagement.vo.ProductSearchVO;
import com.web.toosome.user.menu.vo.MenuVO;
import com.web.toosome.user.product.vo.ProductImageVO;
import com.web.toosome.user.product.vo.ProductVO;

public interface IProductManagementMapper {

	// 상품 목록 조회
	public List<ProductVO> getProductList(ProductSearchVO product);

	// 상품 상세 조회
	public ProductVO getProduct(Integer id);

	// 상품 등록
	public int addProduct(ProductVO product);

	public int addProductImage(ProductImageVO product);

	// 상품 수정
	public int modProduct(ProductVO product);

	public int modProductImage(ProductImageVO product);

	// 상품 삭제
	public int delProduct(ProductVO product);

	public int delProductImage(Integer id);

	// 상품 인덱스
	public int getProductIndex();

	// AI 초기화
	public void aiReset();

}

package com.web.toosome.admin.productManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.productManagement.dao.IProductManagementMapper;
import com.web.toosome.admin.productManagement.vo.ProductSearchVO;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.product.vo.ProductImageVO;
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
		ProductVO menu = mapper.getProduct(id);
		ProductImageVO image = menu.getProductImageVO();
		if(image != null) {
			menu.setProductImagePath(image.getProductImageRoute() + "/" + image.getProductImageName() + "." + image.getProductImageExtention());
		}else {
			menu.setProductImagePath("img/pages/admin/subpages/setting/blank.png");
		}
		return menu;
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

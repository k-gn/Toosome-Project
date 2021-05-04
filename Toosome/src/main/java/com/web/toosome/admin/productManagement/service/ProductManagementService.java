package com.web.toosome.admin.productManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public int addProduct(ProductVO product) {
		mapper.aiReset();
		int index = mapper.getProductIndex();
		int result = mapper.addProduct(product);
		
		ProductImageVO productImage = product.getProductImageVO();
		productImage.setProductProductId(index);
		
		String[] productImageName = product.getFile().getOriginalFilename().split("\\.");
		productImage.setProductImageRoute(productPath);
		productImage.setProductImageName(productImageName[0]);
		productImage.setProductImageExtention(productImageName[1]);
		
		mapper.addProductImage(productImage);
		s3.upload(product.getFile(), productPath + "/");
		
		return result;
	}
	
	@Transactional
	@Override
	public int modProduct(ProductVO product) {
		ProductImageVO productImage = product.getProductImageVO();
		productImage.setProductProductId(product.getProductId());
		int result = mapper.modProduct(product);
		String[] productImageNames = product.getFile().getOriginalFilename().split("\\.");
		
		String productImageName = "";
		if(product.getFile() != null) {
			productImageName = product.getFile().getOriginalFilename();
		}
		
		if(!productImageName.equals("")) {
			s3.delete(product.getOldImageName());
			s3.upload(product.getFile(), productPath + "/");
			
			productImage.setProductImageRoute(productPath);
			productImage.setProductImageName(productImageNames[0]);
			productImage.setProductImageExtention(productImageNames[1]);
			mapper.modProductImage(productImage);
		}
		
		return result;
	}

	@Transactional
	@Override
	public int delProduct(ProductVO product) {
		mapper.delProductImage(product.getProductId());
		int result = mapper.delProduct(product);
		s3.delete(product.getOldImageName());
		return result;
	}
}

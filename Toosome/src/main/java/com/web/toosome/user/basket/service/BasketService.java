package com.web.toosome.user.basket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.basket.dao.IBasketMapper;
import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.product.dao.ProductMapper;
import com.web.toosome.user.product.vo.ProductVO;

@Service
public class BasketService implements IBasketService {
	
	@Autowired
	private IBasketMapper bmapper;
	
	@Autowired
	private ProductMapper pmapper;

	@Override
	public int addBasket(BasketVO basket) {
		
		int pid = bmapper.getBasketProductId(basket);
		if(pid > 0) {
			bmapper.modBasketAmount(basket);
			return 1;
		}
		
		ProductVO product = pmapper.getproductDetailById(basket.getProductId());
		System.out.println("addbasket : " + product);
		basket.setProductImageId(product.getProductImageVO().getProductImageId());
		basket.setBasketName(product.getProductTitleName());
		basket.setBasketPrice(product.getProductPrice());
		System.out.println("addbasket : " + basket);
		return bmapper.addBasket(basket);
	}

	@Override
	public List<BasketVO> getBasket(Integer id) {
		return bmapper.getBasket(id);
	}

	@Override
	public int delBasket(Integer id) {
		return bmapper.delBasket(id);
	}

	@Override
	public void setBasketAmount(Integer amount, Integer bid) {
		Map<String, Integer> map = new HashMap<>();
		map.put("amount", amount);
		map.put("bid", bid);
		bmapper.setBasketAmount(map);
	}


}

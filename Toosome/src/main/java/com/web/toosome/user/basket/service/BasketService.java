package com.web.toosome.user.basket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.basket.dao.IBasketMapper;
import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;
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

	@Override
	public int orderSubmit(OrdersVO order) {
		return bmapper.orderSubmit(order);
	}

	@Override
	public OrdersVO getOrdersList(Integer id) {
		return bmapper.getOrdersList(id);
	}

	@Override
	public void orderBasketDel(Integer id) {
		bmapper.orderBasketDel(id);
	}

	@Override
	public void basketsendorder(BasketVO basket) {
		bmapper.basketsendorder(basket);
	}

	@Override
	public List<BasketVO> getBasketList(Integer id) {
		return bmapper.getBasketList(id);
	}

	@Override
	public List<OrdersDetailVO> getOrdersDetailList(Map<String, Integer> map) {
		return bmapper.getOrdersDetailList(map);
	}

	@Override
	public List<OrdersVO> getAllOrdersList(Integer id) {
		return bmapper.getAllOrdersList(id);
	}

	@Override
	public int updateMerchantUid(OrdersVO ordersVO) {
		return bmapper.updateMerchantUid(ordersVO);
	}

	@Override
	public BasketVO getbasketName(Integer id) {
		return bmapper.getbasketName(id);
	}

	@Override
	public String getMerchantUid(Integer id) {
		return bmapper.getMerchantUid(id);
	}

	@Override
	public int ordersDetailDel(Integer id) {
		return bmapper.ordersDetailDel(id);
	}

	@Override
	public int ordersDel(Integer id) {
		return bmapper.ordersDel(id);
	}

	@Override
	public String getLookPostList(Integer id) {
		return bmapper.getLookPostList(id);
	}
	


}

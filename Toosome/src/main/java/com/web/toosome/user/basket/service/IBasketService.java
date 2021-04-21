package com.web.toosome.user.basket.service;

import java.util.List;

import com.web.toosome.user.basket.vo.BasketVO;

public interface IBasketService {

	// 장바구니 추가
	public int addBasket(BasketVO basket);

	// 장바구니 가져오기
	public List<BasketVO> getBasket(Integer id);
}

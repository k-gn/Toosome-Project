package com.web.toosome.user.basket.dao;

import java.util.List;
import java.util.Map;

import com.web.toosome.user.basket.vo.BasketVO;

public interface IBasketMapper {
	
	// 장바구니 추가
	public int addBasket(BasketVO basket);
	
	// 장바구니 가져오기
	public List<BasketVO> getBasket(Integer id);
	
	// 회원의 중복 상품 검색
	public int getBasketProductId(BasketVO basket);

	// 장바구니 상품 수량 + 1
	public int modBasketAmount(BasketVO basket);
	
	// 장바구니 수량 설정
	public void setBasketAmount(Map<String, Integer> map);
	
	// 장바구니 품목 삭제
	public int delBasket(Integer id);
	
	// 장바구니 품목 삭제
	public int delBasketById(Integer id);
}

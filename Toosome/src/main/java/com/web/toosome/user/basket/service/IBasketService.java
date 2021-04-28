package com.web.toosome.user.basket.service;

import java.util.List;

import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.basket.vo.OrdersVO;

public interface IBasketService {

	// 장바구니 추가
	public int addBasket(BasketVO basket);

	// 장바구니 가져오기
	public List<BasketVO> getBasket(Integer id);

	// 장바구니 수량 설정
	public void setBasketAmount(Integer amount, Integer bid);

	// 장바구니 품목 삭제
	public int delBasket(Integer id);
	
	// 주문정보 저장.
	public int orderSubmit(OrdersVO order);
	
	// 주문 정보 가져오기
	public OrdersVO getOrdersList(Integer id);
	
	// 상품 결제 완료 후 장바구니 데이터 삭제
	public void orderBasketDel(Integer id);
	 
}

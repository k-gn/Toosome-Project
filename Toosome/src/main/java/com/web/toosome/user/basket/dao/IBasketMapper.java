package com.web.toosome.user.basket.dao;

import java.util.List;
import java.util.Map;

import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;

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
	
	// 주문정보 저장.
	public int orderSubmit(OrdersVO order);
	
	// 주문 정보 가져오기
	public OrdersVO getOrdersList(Integer id);
	
	// 장바구니 품목 삭제
	public int delBasketById(Integer id);

	// 상품 결제 완료 후 장바구니 데이터 삭제
	public void orderBasketDel(Integer id);
	
	//장바구니에 데이터를 order_diteil에 복사.
	public void basketsendorder(BasketVO basket);
	
	// 장바구니 정보 정렬해서 가져오기
	public List<BasketVO> getBasketList(Integer id);
	
	// 주문 내역 가져오기.
	public List<OrdersDetailVO> getOrdersDetailList(Map<String, Integer> map);
	
	// 주문 정보 전부 가져오기(orders)
	public List<OrdersVO> getAllOrdersList(Integer id);

	// merchantUid를 Orders에 저장
	public int updateMerchantUid(OrdersVO ordersVO);
	
	// 장바구니에서 상품이름 하나만 가져오기.
	public BasketVO getbasketName(Integer id);
	
	// MerchantUid 가져오기.
	public String getMerchantUid(Integer id);
	
	// 주문 취소 후 ordersDetail 삭제
	public int ordersDetailDel(Integer id);
		
	// 주문 취소 후 orders 삭제
	public int ordersDel(Integer id);
	
	// order테이블에 맞는 배송상태 출력
	public String getLookPostList(Integer id);
		
}

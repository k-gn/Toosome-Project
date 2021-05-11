package com.web.toosome.user.basket.service;

import java.util.List;
import java.util.Map;

import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;
import com.web.toosome.user.product.vo.ProductVO;

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

	// 삭제하는 orders 데이터를 ordersCancel로 옮김.
	public int setordersCancel(OrdersVO ordersVO);
	
	// 삭제하는 ordersDetail 데이터를 ordersCancelDetail로 옮김.
	public void setordersCancelDetail(OrdersDetailVO ordersDetailVO);
	
	// orderCancel Id 얻어오기.
	public int getOrdersCancelId(Integer id);
	
	// ordersDetail에 상품이름과 수량을 Product에 입력하여 이름에 맞는 수량 감소(주문).
	public void setproductAmountDownCounter(OrdersDetailVO ordersDetailListOne);
	
	// ordersDetail에 상품이름과 수량을 Product에 입력하여 이름에 맞는 수량 증가 (주문취소).
	public int setproductAmountUpCounter(OrdersDetailVO ordersDetailListOne);
		
	// Product에 상품이름을 조건으로 재고가 주문 수량 보다 작은지 확인
	public ProductVO setproductAmountCheck(OrdersDetailVO ordersDetailListOne);
}

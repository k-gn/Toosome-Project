package com.web.toosome.admin.orderManagement.service;

import java.util.List;

import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;

public interface IOrderManagementService {
	// admin order 페이지 List출력.
	public List<OrdersVO> getOrderList(OrderManagementVO orderVO);
	
	// admin order Detaildp 출력할 orders 데이터 가져오기.
	public OrdersVO getorderDetail(Integer id);
	
	// admin order Detail Lsit 페이지 출력.
	public List<OrdersDetailVO> getorderDetailListTwo(Integer id);


}

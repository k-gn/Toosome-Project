package com.web.toosome.admin.orderManagement.dao;

import java.util.List;

import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersVO;

public interface IOrderManagementMapper {
	// admin order 페이지 List출력.
	public List<OrdersVO> getOrderList(OrderManagementVO orderVO);
}

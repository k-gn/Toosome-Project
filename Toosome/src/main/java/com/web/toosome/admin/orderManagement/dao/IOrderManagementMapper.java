package com.web.toosome.admin.orderManagement.dao;

import java.util.List;

import com.web.toosome.admin.orderManagement.vo.OrderCancelManagementVO;
import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersCancelDetailVO;
import com.web.toosome.user.basket.vo.OrdersCancelVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;

public interface IOrderManagementMapper {
	// admin order 페이지 List출력.
	public List<OrdersVO> getOrderList(OrderManagementVO odVO);
	
	// admin order Detaildp 출력할 orders 데이터 가져오기.
	public OrdersVO getorderDetail(Integer id);
	
	// admin order Detail Lsit 페이지 출력.
	public List<OrdersDetailVO> getorderDetailListTwo(Integer id);
	
	// admin order Update.
	public int updateOrders(OrdersVO orderVO);

	// admin orderCancel 페이지 List출력.
	public List<OrdersCancelVO> getOrderCancelList(OrderCancelManagementVO ocmVO);
	
	// admin orderCancel Detaildp 출력할 orders 데이터 가져오기.
	public OrdersCancelVO getorderCancelDetail(Integer id);
	
	// admin orderCancel Detail Lsit 페이지 출력.
	public List<OrdersCancelDetailVO> getorderCancelDetailList(Integer id);
}

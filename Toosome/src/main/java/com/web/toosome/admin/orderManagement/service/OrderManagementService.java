package com.web.toosome.admin.orderManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.orderManagement.dao.IOrderManagementMapper;
import com.web.toosome.admin.orderManagement.vo.OrderCancelManagementVO;
import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersCancelDetailVO;
import com.web.toosome.user.basket.vo.OrdersCancelVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;

@Service
public class OrderManagementService implements IOrderManagementService {
	
	@Autowired
	private IOrderManagementMapper mapper;
	
	@Override
	public List<OrdersVO> getOrderList(OrderManagementVO odVO) {
		return mapper.getOrderList(odVO);
	}

	@Override
	public OrdersVO getorderDetail(Integer id) {
		return mapper.getorderDetail(id);
	}
	
	@Override
	public List<OrdersDetailVO> getorderDetailListTwo(Integer id) {
		System.out.println("1");
		return mapper.getorderDetailListTwo(id);
	}

	@Override
	public int updateOrders(OrdersVO orderVO) {
		return mapper.updateOrders(orderVO);
	}

	@Override
	public List<OrdersCancelVO> getOrderCancelList(OrderCancelManagementVO ocmVO) {
		return mapper.getOrderCancelList(ocmVO);
	}

	@Override
	public OrdersVO getorderCancelDetail(Integer id) {
		return mapper.getorderCancelDetail(id);
	}
	
	@Override
	public List<OrdersCancelDetailVO> getorderCancelDetailList(Integer id) {
		return mapper.getorderCancelDetailList(id);
	}


}

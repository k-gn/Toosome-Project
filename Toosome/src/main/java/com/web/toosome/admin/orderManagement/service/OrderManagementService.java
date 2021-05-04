package com.web.toosome.admin.orderManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.orderManagement.dao.IOrderManagementMapper;
import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;

@Service
public class OrderManagementService implements IOrderManagementService {
	
	@Autowired
	private IOrderManagementMapper mapper;
	
	@Override
	public List<OrdersVO> getOrderList(OrderManagementVO orderVO) {
		return mapper.getOrderList(orderVO);
	}

	@Override
	public OrdersVO getorderDetail(Integer id) {
		return mapper.getorderDetail(id);
	}
	
	@Override
	public List<OrdersDetailVO> getorderDetailListTwo(Integer id) {
		System.out.println("서비스");
		System.out.println(mapper.getorderDetailListTwo(id));
		return mapper.getorderDetailListTwo(id);
	}

	@Override
	public int updateOrders(OrdersVO orderVO) {
		return mapper.updateOrders(orderVO);
	}

	

}

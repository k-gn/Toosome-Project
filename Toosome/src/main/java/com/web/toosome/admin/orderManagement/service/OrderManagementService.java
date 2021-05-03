package com.web.toosome.admin.orderManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.orderManagement.dao.IOrderManagementMapper;
import com.web.toosome.admin.orderManagement.vo.OrderManagementVO;
import com.web.toosome.user.basket.vo.OrdersVO;

@Service
public class OrderManagementService implements IOrderManagementService {
	
	@Autowired
	private IOrderManagementMapper mapper;
	
	@Override
	public List<OrdersVO> getOrderList(OrderManagementVO orderVO) {
		return mapper.getOrderList(orderVO);
	}

}

package com.web.toosome.admin.mainManagement.dao;

import java.util.List;

import com.web.toosome.admin.mainManagement.vo.DailyVO;

public interface IMainMapper {

	// 전날 가입자 수
	public Integer getRegCount();
	
	// 전날 주문건수
	public Integer getOrderCount();
	
	// 전날 매출
	public Integer getSales();
	
	// 데일리 세일즈
	public List<DailyVO> getDailySalesInfo();
	
	// 데일리 접속자 
	public List<DailyVO> getDailyVisitInfo();
	
	// 데일리 주문
	public List<DailyVO> getDailyOrderInfo();
	
}

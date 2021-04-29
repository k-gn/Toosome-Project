package com.web.toosome.admin.statistics.dao;

import com.web.toosome.admin.statistics.vo.StatisticsVO;

public interface IStatisticsMapper {

	// 총 결제 금액
	public int getTotalPayment(StatisticsVO vo);
	
	// 총 판매 이익
	public int getTotalSales(StatisticsVO vo);
	
	// 총 판매 건수
	public int getTotalSalesCount(StatisticsVO vo);
	
	// 월별 결제 금액
	
	// 월별 판매 건수
	
	// 월별 판매 이익
}

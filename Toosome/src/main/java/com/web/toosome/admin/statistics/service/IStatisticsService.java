package com.web.toosome.admin.statistics.service;

import com.web.toosome.admin.statistics.vo.StatisticsVO;

public interface IStatisticsService {

	// 총 결제 금액
	public int getTotalPayment(StatisticsVO vo);

	// 총 판매 이익
	public int getTotalSales(StatisticsVO vo);

	// 총 판매 건수
	public int getTotalSalesCount(StatisticsVO vo);
}

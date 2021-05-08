package com.web.toosome.admin.statistics.dao;

import java.util.List;

import com.web.toosome.admin.statistics.vo.DailyOrderVO;
import com.web.toosome.admin.statistics.vo.StatisticsVO;

public interface IStatisticsMapper {

	// 총 결제 금액
	public Integer getTotalPayment(StatisticsVO vo);
	
	// 총 판매 건수
	public Integer getTotalSalesCount(StatisticsVO vo);
	
	// 월별 결제 금액 + 판매 건수
	public List<DailyOrderVO> getDailyInfo(StatisticsVO vo);
	
	// 일자별 판매 현황
	public List<StatisticsVO> getDailyOrdersList(StatisticsVO vo);
}

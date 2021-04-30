package com.web.toosome.admin.statistics.service;

import java.util.List;

import com.web.toosome.admin.statistics.vo.DailyOrderVO;
import com.web.toosome.admin.statistics.vo.StatisticsVO;

public interface IStatisticsService {
	
	public int getTotalPayment(StatisticsVO vo);

	public int getTotalSalesCount(StatisticsVO vo);
	
	public List<StatisticsVO> getDailyOrdersList(StatisticsVO vo);
	
	public List<DailyOrderVO> getDailyInfo(StatisticsVO vo);
}

package com.web.toosome.admin.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.statistics.dao.IStatisticsMapper;
import com.web.toosome.admin.statistics.vo.DailyOrderVO;
import com.web.toosome.admin.statistics.vo.StatisticsVO;

@Service
public class StatisticsService implements IStatisticsService {
	
	@Autowired
	private IStatisticsMapper mapper;

	@Override
	public int getTotalPayment(StatisticsVO vo) {
		return mapper.getTotalPayment(vo);
	}

	@Override
	public int getTotalSalesCount(StatisticsVO vo) {
		return mapper.getTotalSalesCount(vo);
	}

	@Override
	public List<StatisticsVO> getDailyOrdersList(StatisticsVO vo) {
		return mapper.getDailyOrdersList(vo);
	}

	@Override
	public List<DailyOrderVO> getDailyInfo(StatisticsVO vo) {
		return mapper.getDailyInfo(vo);
	}

}

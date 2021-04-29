package com.web.toosome.admin.statistics.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.statistics.dao.IStatisticsMapper;
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
	public int getTotalSales(StatisticsVO vo) {
		return mapper.getTotalSales(vo);
	}

	@Override
	public int getTotalSalesCount(StatisticsVO vo) {
		return mapper.getTotalSalesCount(vo);
	}

}

package com.web.toosome.admin.mainManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.mainManagement.dao.IMainMapper;
import com.web.toosome.admin.mainManagement.vo.DailyVO;

@Service
public class MainService implements IMainService {
	
	@Autowired
	private IMainMapper mapper;

	@Override
	public Integer getRegCount() {
		return mapper.getRegCount();
	}

	@Override
	public List<DailyVO> getDailyVisitInfo() {
		return mapper.getDailyVisitInfo();
	}

}

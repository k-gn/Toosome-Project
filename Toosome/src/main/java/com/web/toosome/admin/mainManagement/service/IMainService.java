package com.web.toosome.admin.mainManagement.service;

import java.util.List;

import com.web.toosome.admin.mainManagement.vo.DailyVO;

public interface IMainService {
	
	public Integer getRegCount();
	
	public List<DailyVO> getDailyVisitInfo();

}

package com.web.toosome.admin.mainManagement.service;

import com.web.toosome.admin.mainManagement.vo.VisitorVO;

public interface IVisitorService {

	public int insertVisitor(VisitorVO vo);
	
	public VisitorVO getVisitInfo(String ip);
	
	public void setTimezone();
}

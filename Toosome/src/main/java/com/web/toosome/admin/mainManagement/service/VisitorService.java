package com.web.toosome.admin.mainManagement.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.toosome.admin.mainManagement.persistence.IVisitorMapper;
import com.web.toosome.admin.mainManagement.vo.VisitorVO;

public class VisitorService implements IVisitorService {
	
	@Autowired
	private IVisitorMapper mapper;

	@Override
	public int insertVisitor(VisitorVO vo) {
		return mapper.insertVisitor(vo);
	}

	@Override
	public VisitorVO getVisitInfo(String ip) {
		return mapper.getVisitInfo(ip);
	}

	@Override
	public void setTimezone() {
		mapper.setTimezone();
	}

	@Override
	public int visitCount() {
		return mapper.visitCount();
	}

}

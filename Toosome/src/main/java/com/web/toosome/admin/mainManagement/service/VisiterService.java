package com.web.toosome.admin.mainManagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.mainManagement.dao.IVisiterMapper;
import com.web.toosome.admin.mainManagement.vo.VisiterVO;

@Service
public class VisiterService implements IVisiterService {
	
	@Autowired
	private IVisiterMapper mapper;

	@Override
	public int insertVisitor(VisiterVO vo) {
		return mapper.insertVisitor(vo);
	}

}

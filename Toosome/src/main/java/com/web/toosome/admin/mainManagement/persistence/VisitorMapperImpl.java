package com.web.toosome.admin.mainManagement.persistence;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.toosome.admin.mainManagement.vo.VisitorVO;

public class VisitorMapperImpl implements IVisitorMapper {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertVisitor(VisitorVO vo) {
		return sqlSessionTemplate.insert("VisitMapper.insert", vo);
	}

	@Override
	public VisitorVO getVisitInfo(String ip) {
		return sqlSessionTemplate.selectOne("VisitMapper.selectOne", ip);
	}

	@Override
	public void setTimezone() {
		sqlSessionTemplate.insert("VisitMapper.setTimezone");
	}

	@Override
	public int visitCount() {
		return sqlSessionTemplate.selectOne("VisitMapper.visitCount");
	}

}

package com.web.toosome.admin.mainManagement.persistence;

import com.web.toosome.admin.mainManagement.vo.VisitorVO;

public interface IVisitorMapper {

	// 방문자 추가
	public int insertVisitor(VisitorVO vo);
	
	// 방문자 정보
	public VisitorVO getVisitInfo(String ip);
	
	// 타임존 설정
	public void setTimezone();
	
	// 전날 방문자 수
	public int visitCount();
}

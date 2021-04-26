package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.IEventAdminMapper;
import com.web.toosome.user.board.vo.EventBoardVO;

@Service
public class EventAdminService implements IEventAdminService {

	@Autowired
	private IEventAdminMapper mapper;
	
	@Override
	public List<EventBoardVO> getEventBoard(EventBoardVO vo) {
		System.out.println("관리자 이벤트 게시판 서비스" + mapper.getEventBoard(vo));
		return mapper.getEventBoard(vo);
	}

	@Override
	public List<EventBoardVO> searchEventBoard(String keyword) {
		System.out.println("관리자 이벤트 게시판 검색 기능" + mapper.searchEventBoard(keyword));
		return mapper.searchEventBoard(keyword);
	}

}

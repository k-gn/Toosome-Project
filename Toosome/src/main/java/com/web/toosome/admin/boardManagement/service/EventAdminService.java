package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.toosome.admin.boardManagement.dao.IEventAdminMapper;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
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
	public List<EventBoardVO> searchEventBoard(BoardSearchVO vo) {
		System.out.println("관리자 이벤트 게시판 검색 기능" + mapper.searchEventBoard(vo));
		return mapper.searchEventBoard(vo);
	}
	
	
	@Override
	public int insertEvent(EventBoardVO vo) {
		mapper.insertEvent(vo);
		int insertevent = mapper.insertEvent(vo);
		return insertevent;
	}
	
	
	@Override
	public int insertDetailEvent(EventBoardDetailVO vo) {
		mapper.insertDetailEvent(vo);
		int insertdetailevent = mapper.insertDetailEvent(vo);
		return insertdetailevent;
	}
	
	
	@Override
	public EventBoardVO eventBoardDetail(Integer id) {
		return mapper.eventBoardDetail(id);
	}
	
	
	@Override
	public int deleteEvent(Integer id) {
		mapper.deleteEvent(id);
		int deleteevent = mapper.deleteEvent(id);
		return deleteevent;
	}
	
	
	@Override
	public int deleteDetailEvent(Integer id) {
		mapper.deleteDetailEvent(id);
		int deletedetailevent = mapper.deleteDetailEvent(id);
		return deletedetailevent;
	}
	
	
	@Override
	public int updateEvent(EventBoardVO vo) {
		mapper.updateEvent(vo);
		int updateevent = mapper.updateEvent(vo);
		return updateevent;
	}
	
	@Override
	public int updateEventDetail(EventBoardDetailVO vo) {
		mapper.updateEventDetail(vo);
		int updateeventdetail = mapper.updateEventDetail(vo);
		return updateeventdetail;
	}

}

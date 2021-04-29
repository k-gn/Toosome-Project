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
		return mapper.getEventBoard(vo);
	}

	@Override
	public List<EventBoardVO> searchEventBoard(BoardSearchVO vo) {
		return mapper.searchEventBoard(vo);
	}
	
	
	@Override
	public int insertEvent(EventBoardVO vo) {
		int insertevent = mapper.insertEvent(vo);
		return insertevent;
	}
	
	
	@Override
	public int insertDetailEvent(EventBoardDetailVO vo) {
		int insertdetailevent = mapper.insertDetailEvent(vo);
		return insertdetailevent;
	}
	
	
	@Override
	public EventBoardVO eventBoardDetail(Integer id) {
		return mapper.eventBoardDetail(id);
	}
	
	
	@Override
	public int deleteEvent(Integer id) {
		int deleteevent = mapper.deleteEvent(id);
		return deleteevent;
	}
	
	
	@Override
	public int deleteDetailEvent(Integer id) {
		int deletedetailevent = mapper.deleteDetailEvent(id);
		return deletedetailevent;
	}
	
	
	@Override
	public int updateEvent(EventBoardVO vo) {
		int updateevent = mapper.updateEvent(vo);
		return updateevent;
	}
	
	@Override
	public int updateEventDetail(EventBoardDetailVO vo) {
		int updateeventdetail = mapper.updateEventDetail(vo);
		System.out.println(updateeventdetail + "이벤트 디테일 업데이트 구문");
		return updateeventdetail;
	}

}

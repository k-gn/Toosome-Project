package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
import com.web.toosome.user.board.vo.EventBoardVO;


public interface IEventAdminService {
	
	List<EventBoardVO>getEventBoard(EventBoardVO vo);
	
	List<EventBoardVO>searchEventBoard(BoardSearchVO vo);
	
	int insertEvent(EventBoardVO vo);
	
	int insertDetailEvent(EventBoardDetailVO vo);
	
	EventBoardVO eventBoardDetail(Integer id);
	
	int deleteEvent(Integer id);
	
	int deleteDetailEvent(Integer id);
	
	int updateEvent(EventBoardVO vo);
	
	int updateEventDetail(EventBoardDetailVO vo);


}

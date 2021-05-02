package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
import com.web.toosome.user.board.vo.EventBoardVO;

public interface IEventAdminMapper {
	
	List<EventBoardVO>getEventBoard(EventBoardVO vo);
	
	List<EventBoardVO>searchEventBoard(BoardSearchVO vo);
	
	int insertEvent(EventBoardVO vo);
	
	int insertDetailEvent(EventBoardDetailVO vo);
	
	EventBoardVO eventBoardDetail(Integer id);
	
	int deleteEvent(Integer id);
	
	int deleteDetailEvent(Integer id);
	
	int updateEvent(EventBoardVO vo);
	
	int updateEventDetail(EventBoardDetailVO vo);
	
	EventBoardVO selectFile(EventBoardVO vo);
	
	EventBoardDetailVO selectDetailFile(EventBoardDetailVO vo);
	
	void updateEventText(EventBoardVO vo);
	
	EventBoardVO selectIdFile(Integer id);
	
	EventBoardDetailVO selectIdDetailFile(Integer id);
	

}

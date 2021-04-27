package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
import com.web.toosome.user.board.vo.EventBoardVO;

public interface IEventAdminMapper {
	
	List<EventBoardVO>getEventBoard(EventBoardVO vo);
	
	List<EventBoardVO>searchEventBoard(BoardSearchVO vo);
	
	void insertEvent(EventBoardVO vo);
	
	void insertDetailEvent(EventBoardDetailVO vo);

}

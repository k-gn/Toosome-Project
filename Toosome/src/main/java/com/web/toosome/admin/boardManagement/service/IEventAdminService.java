package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardVO;


public interface IEventAdminService {
	
	List<EventBoardVO>getEventBoard(EventBoardVO vo);
	
	List<EventBoardVO>searchEventBoard(BoardSearchVO vo);


}

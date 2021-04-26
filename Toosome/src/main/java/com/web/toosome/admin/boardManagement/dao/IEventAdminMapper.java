package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.EventBoardVO;

public interface IEventAdminMapper {
	
	List<EventBoardVO>getEventBoard(EventBoardVO vo);

}

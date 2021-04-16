package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.EventBoardVO;

public interface IEventBoardMapper {
	
	public List<EventBoardVO> getEventBoardList(EventBoardVO vo);
	
	public List<EventBoardVO> getEventBoardDetail(String index);
	
	public List<EventBoardVO> getSearchList(String keyword);
	
	public List<EventBoardVO> getEndEventBoardList(EventBoardVO vo);
	
	public void eventBoardCount(String index);
		

}

package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.IEventBoardMapper;
import com.web.toosome.user.board.vo.EventBoardVO;

@Service
public class EventBoardService implements IEventBoardService {
	
	@Autowired
	private IEventBoardMapper mapper;

	@Override
	public List<EventBoardVO> getEventBoard(EventBoardVO vo) throws Exception{
		
		return mapper.getEventBoardList(vo);
	}

	@Override
	public List<EventBoardVO> getEventBoardDetail(String index) throws Exception {
	
		return mapper.getEventBoardDetail(index);
	}

	@Override
	public void eventBoardCount(String index) throws Exception {
		mapper.eventBoardCount(index);
	}

	@Override
	public List<EventBoardVO> getSearchList(String keyword) throws Exception {
		
		return mapper.getSearchList(keyword);
	}

	@Override
	public List<EventBoardVO> getEndEventBoard(EventBoardVO vo) throws Exception {
		
		return mapper.getEndEventBoardList(vo);
	}

}

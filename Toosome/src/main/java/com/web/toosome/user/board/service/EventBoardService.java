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
		System.out.println("이벤트 게시판 리스트 (서비스)넘어가는 값 : "+ mapper.getEventBoardList(vo));
		return mapper.getEventBoardList(vo);
	}

	@Override
	public List<EventBoardVO> getEventBoardDetail(String index) throws Exception {
		System.out.println("이벤트 게시판 세부 정보(서비스)넘어가는 값 :" + mapper.getEventBoardDetail(index));
		return mapper.getEventBoardDetail(index);
	}

	@Override
	public void eventBoardCount(String index) throws Exception {
		mapper.eventBoardCount(index);
	}

	@Override
	public List<EventBoardVO> getSearchList(String keyword) throws Exception {
		System.out.println("이벤트 게시판 검색(서비스)값: " + mapper.getSearchList(keyword));
		return mapper.getSearchList(keyword);
	}

	@Override
	public List<EventBoardVO> getEndEventBoard(EventBoardVO vo) throws Exception {
		System.out.println("이벤트 게시판 리스트 마감된이벤트(서비스)값 : " +  mapper.getEndEventBoardList(vo));
		return mapper.getEndEventBoardList(vo);
	}

}

package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.EventBoardVO;

public interface IEventBoardService {
	
	//이벤트 게시판 목록 구현
	public List<EventBoardVO> getEventBoard(EventBoardVO vo)throws Exception;
	
	//게시물 세부 조회
	public List<EventBoardVO> getEventBoardDetail(String index)throws Exception;

	//게시물 조회 수
	public void eventBoardCount(String index) throws Exception;
	
	//게시물 검색 기능
	public List<EventBoardVO> getSearchList(String keyword) throws Exception;
}

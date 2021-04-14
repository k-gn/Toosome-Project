package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.NewsBoardDetailVO;
import com.web.toosome.user.board.vo.NewsBoardVO;

public interface INewsBoardService {
	
	//뉴스 게시물 리스트로 가져오기
	public List<NewsBoardVO> getNewsBoardList(NewsBoardVO vo)throws Exception;
	
	//뉴스 게시물 상세 조회(이전글 다음글 구현으로 정보 3개 쏴줄것)
	public List<NewsBoardVO>getNewsBoardDetail(String index)throws Exception;
	
	//뉴스 게시물 리스트 검색 기능
	public List<NewsBoardVO> getSearchNews(String keyword)throws Exception;
	
	//뉴스 게시물 조회수 증가
	public void newsBoardCount(String index)throws Exception;
	

}

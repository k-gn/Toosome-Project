package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;

public interface IFaqBoardMapper {
	public List<FaqBoardVO> getFaqBoardList(FaqBoardVO vo); // faq 리스트 출력
	
	public List<FaqBoardVO> getFaqSearchBoardList(String keyword); // faq 검색 리스트 
}

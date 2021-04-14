package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.NewsBoardDetailVO;
import com.web.toosome.user.board.vo.NewsBoardVO;

public interface INewsBoardMapper {

	public List<NewsBoardVO> getNewsBoardList(NewsBoardVO vo);
	
	public List<NewsBoardVO> getNewsBoardDetail(String index);
	
	public List<NewsBoardVO> getSearchNews(String keyword);
	
	public void NoticeBoardCount(String index);	

}

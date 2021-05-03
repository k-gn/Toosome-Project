package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.NewsBoardDetailVO;
import com.web.toosome.user.board.vo.NewsBoardVO;

public interface INewsAdminService {
	
	List<NewsBoardVO> getNewsList(NewsBoardVO vo);
	
	List<NewsBoardVO> searchNewsBoard(BoardSearchVO vo);
	
	int insertNewsBoard(NewsBoardVO vo);
	
	int insertNewsBoardDetail(NewsBoardDetailVO vo);
	
	int deleteNewsBoard(NewsBoardVO vo);
	
	int deleteNewsBoardDetail(NewsBoardDetailVO vo);
	
	int updateNewsBoard(NewsBoardVO vo);
	
	int updateNewsBoardDetail(NewsBoardDetailVO vo);
	
	int updateNewsBoardText(NewsBoardVO vo);
	
	int updateNewsBoardDetailText(NewsBoardDetailVO vo);
	
	
	NewsBoardVO selectFile(NewsBoardVO vo);
	
}

package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.NewsBoardDetailVO;
import com.web.toosome.user.board.vo.NewsBoardVO;

public interface INewsAdminMapper {
	List<NewsBoardVO> getNewsList(NewsBoardVO vo);

	List<NewsBoardVO> seachNewsBoard(BoardSearchVO vo);
	
	List<NewsBoardVO> newsBoardDetail(NewsBoardVO vo);
	
	int insertNewsBoard(NewsBoardVO vo);
	
	int insertNewsBoardDetail(NewsBoardDetailVO vo);
	
	int updateNewsBoard(NewsBoardVO vo);
	
	int updateNewsBoardDetail(NewsBoardDetailVO vo);
	
	int deleteNewsBoard(Integer id);
	
	int deleteNewsBoardDetail(Integer id);
	
	int updateNewsBoardText(NewsBoardVO vo);
	
	int updateNewsBoardDetailText(NewsBoardDetailVO vo);
	
	NewsBoardVO selectFile(Integer id);
	
	NewsBoardDetailVO selectDFile(Integer id);
	
	NewsBoardVO selectUpdateFile(NewsBoardVO vo);
	
	NewsBoardDetailVO selectUpdateDFile(NewsBoardDetailVO vo);
	
}

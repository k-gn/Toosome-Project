package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;
import com.web.toosome.user.board.vo.BoardSearchVO;

public interface IFaqAdminMapper {
	
	List<FaqBoardVO> faqBoardList(FaqBoardVO vo);
	
	List<FaqBoardVO> faqSearch(BoardSearchVO vo);
	
	int insertFaq(FaqBoardVO vo);
	
	int deleteFaq(FaqBoardVO vo);
	
	int updateFaq(FaqBoardVO vo);
	
	List<FaqBoardVO> faqBoardDetail(FaqBoardVO vo);

}

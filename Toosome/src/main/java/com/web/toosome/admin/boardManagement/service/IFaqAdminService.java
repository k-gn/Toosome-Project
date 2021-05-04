package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;
import com.web.toosome.user.board.vo.BoardSearchVO;
public interface IFaqAdminService {

	List<FaqBoardVO> faqBoardList(FaqBoardVO vo);

	List<FaqBoardVO> faqSearch(BoardSearchVO vo);
	
	List<FaqBoardVO> faqBoardDetail(FaqBoardVO vo);
	
	int insertFaq(FaqBoardVO vo);
	
	int updateFaq(FaqBoardVO vo);
	
	int deleteFaq(FaqBoardVO vo);

}

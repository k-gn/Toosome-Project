package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;

public interface IFaqAdminMapper {
	
	List<FaqBoardVO> faqBoardList(FaqBoardVO vo);

}

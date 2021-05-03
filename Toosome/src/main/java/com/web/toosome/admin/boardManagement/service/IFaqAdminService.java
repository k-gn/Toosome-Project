package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;

public interface IFaqAdminService {
	
	List<FaqBoardVO> faqBoardList(FaqBoardVO vo);

}

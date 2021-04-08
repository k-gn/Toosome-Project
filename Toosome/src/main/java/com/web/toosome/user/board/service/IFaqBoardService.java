package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;

public interface IFaqBoardService {
	public List<FaqBoardVO> getFaqBoardList(FaqBoardVO vo);
}

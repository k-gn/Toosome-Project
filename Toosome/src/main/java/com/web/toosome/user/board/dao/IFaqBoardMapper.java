package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.FaqBoardVO;

public interface IFaqBoardMapper {
	public List<FaqBoardVO> getFaqBoardList(FaqBoardVO vo);
}

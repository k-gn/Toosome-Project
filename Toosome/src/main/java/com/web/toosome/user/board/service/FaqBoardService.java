package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.IFaqBoardMapper;
import com.web.toosome.user.board.vo.FaqBoardVO;

@Service
public class FaqBoardService implements IFaqBoardService {
	
	@Autowired
	private IFaqBoardMapper mapper;
	
	@Override
	public List<FaqBoardVO> getFaqBoardList(FaqBoardVO faqBoardVO) {
		return mapper.getFaqBoardList(faqBoardVO);
	}

}

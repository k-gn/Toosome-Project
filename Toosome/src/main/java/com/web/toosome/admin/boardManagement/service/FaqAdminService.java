package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.IFaqAdminMapper;
import com.web.toosome.user.board.vo.FaqBoardVO;

@Service
public class FaqAdminService implements IFaqAdminService {

	@Autowired
	private IFaqAdminMapper mapper;
	
	@Override
	public List<FaqBoardVO> faqBoardList(FaqBoardVO vo) {
		return mapper.faqBoardList(vo);
	}

}

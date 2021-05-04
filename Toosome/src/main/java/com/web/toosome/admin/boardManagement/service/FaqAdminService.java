package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.IFaqAdminMapper;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.FaqBoardVO;

@Service
public class FaqAdminService implements IFaqAdminService {

	@Autowired
	private IFaqAdminMapper mapper;
	
	@Override
	public List<FaqBoardVO> faqBoardList(FaqBoardVO vo) {
		return mapper.faqBoardList(vo);
	}

	@Override
	public List<FaqBoardVO> faqSearch(BoardSearchVO vo) {
		return mapper.faqSearch(vo);
	}

	@Override
	public int insertFaq(FaqBoardVO vo) {
		return mapper.insertFaq(vo);
	}

	@Override
	public int updateFaq(FaqBoardVO vo) {
		return mapper.updateFaq(vo);
	}

	@Override
	public int deleteFaq(FaqBoardVO vo) {
		return mapper.deleteFaq(vo);
	}

	@Override
	public List<FaqBoardVO> faqBoardDetail(FaqBoardVO vo) {
		return mapper.faqBoardDetail(vo);
	}

}

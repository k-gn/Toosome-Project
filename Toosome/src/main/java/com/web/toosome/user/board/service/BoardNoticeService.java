package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.IBoardNoticeMapper;
import com.web.toosome.user.board.vo.NoticeBoardVO;

@Service
public class BoardNoticeService implements IBoardNoticeService {

	@Autowired
	private IBoardNoticeMapper mapper;

	@Override
	public List<NoticeBoardVO> getNoticeBoardList(NoticeBoardVO vo) {
		return mapper.getNoticeBoardList(vo);
	}

	@Override
	public void getBoard(NoticeBoardVO noticeboard) {
		// TODO Auto-generated method stub
		
	}
	


	
	
	
	
	
	
}

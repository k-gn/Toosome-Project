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
	public List<NoticeBoardVO> getNoticeBoardList(NoticeBoardVO vo) throws Exception {
		return mapper.getNoticeBoardList(vo);
	}

	@Override
	public NoticeBoardVO getBoard(NoticeBoardVO noticeboard) throws Exception {
		return null;
	}

	@Override
	public void insertNoticeBoardList() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(NoticeBoardVO noticeboard) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int noticeBoardId) throws Exception {
		// TODO Auto-generated method stub
		
	}
	


	
	
	
	
	
	
}

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
		System.out.println(mapper.getNoticeBoardList(vo));
		return mapper.getNoticeBoardList(vo);
	}

	@Override
	public List<NoticeBoardVO> getNoticeBoard(String index) throws Exception {
		System.out.println(mapper.getNoticeBoard(index)+"서비스"); 			
		return mapper.getNoticeBoard(index);
	}

	
	@Override
	public void insertNoticeBoard() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateNoticeBoard(NoticeBoardVO noticeboard) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNoticeBoard(int noticeBoardId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeBoardVO> getSearchNotice(String keyword) throws Exception{
		return mapper.getSearchNotice(keyword);
	}

	@Override
	public void NoticeBoardCount() throws Exception {
		// TODO Auto-generated method stub
		
	}
	


	
	
	
	
	
	
}

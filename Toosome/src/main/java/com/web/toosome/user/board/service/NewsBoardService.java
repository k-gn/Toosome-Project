package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.INewsBoardMapper;
import com.web.toosome.user.board.vo.NewsBoardVO;

@Service
public class NewsBoardService implements INewsBoardService {

	@Autowired
	private INewsBoardMapper mapper;
	
	
	@Override
	public List<NewsBoardVO> getNewsBoardList(NewsBoardVO vo) throws Exception {
		
		return mapper.getNewsBoardList(vo);
	}

	@Override
	public List<NewsBoardVO> getNewsBoardDetail(String index) throws Exception {
	
		return mapper.getNewsBoardDetail(index);
	}

	@Override
	public List<NewsBoardVO> getSearchNews(String keyword) throws Exception {
		
		return mapper.getSearchNews(keyword);
	}

	@Override
	public void newsBoardCount(String index) throws Exception {
	
		mapper.NewsBoardCount(index);
		
	}

}

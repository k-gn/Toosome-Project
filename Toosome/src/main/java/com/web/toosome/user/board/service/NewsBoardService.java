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
		System.out.println("(서비스)뉴스 리스트 : "+ mapper.getNewsBoardList(vo));
		return mapper.getNewsBoardList(vo);
	}

	@Override
	public List<NewsBoardVO> getNewsBoard(String index) throws Exception {
		System.out.println("(서비스)뉴스 상세 : " + mapper.getNewsBoard(index));
		return mapper.getNewsBoard(index);
	}

	@Override
	public List<NewsBoardVO> getSearchNews(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.INewsBoardMapper;
import com.web.toosome.user.board.vo.NewsBoardDetailVO;
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
	public List<NewsBoardVO> getNewsBoardDetail(String index) throws Exception {
		System.out.println("(서비스)뉴스 상세 : " + mapper.getNewsBoardDetail(index));
		return mapper.getNewsBoardDetail(index);
	}

	@Override
	public List<NewsBoardVO> getSearchNews(String keyword) throws Exception {
		System.out.println("뉴스 검색기능 : " + mapper.getSearchNews(keyword));
		return mapper.getSearchNews(keyword);
	}

	@Override
	public void newsBoardCount(String index) throws Exception {
		System.out.println("뉴스 게시판 조회수 기능 ");
		mapper.getSearchNews(index);
		
	}

}

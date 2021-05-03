package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.INewsAdminMapper;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.NewsBoardDetailVO;
import com.web.toosome.user.board.vo.NewsBoardVO;

@Service
public class NewsAdminService implements INewsAdminService {

	@Autowired
	private INewsAdminMapper mapper;
	@Override
	public List<NewsBoardVO> getNewsList(NewsBoardVO vo){
		return mapper.getNewsList(vo);
	}
	@Override
	public List<NewsBoardVO> searchNewsBoard(BoardSearchVO vo) {
		return mapper.seachNewsBoard(vo);
	}
	@Override
	public int insertNewsBoard(NewsBoardVO vo) {
		return mapper.insertNewsBoard(vo);
	}
	@Override
	public int insertNewsBoardDetail(NewsBoardDetailVO vo) {
		return mapper.insertNewsBoardDetail(vo);
	}
	@Override
	public int deleteNewsBoard(NewsBoardVO vo) {
		return mapper.deleteNewsBoard(vo);
	}
	@Override
	public int deleteNewsBoardDetail(NewsBoardDetailVO vo) {
		return mapper.deleteNewsBoardDetail(vo);
	}
	@Override
	public NewsBoardVO selectFile(NewsBoardVO vo) {
		return mapper.selectFile(vo);
	}
	@Override
	public int updateNewsBoard(NewsBoardVO vo) {
		return mapper.updateNewsBoard(vo);
	}
	@Override
	public int updateNewsBoardDetail(NewsBoardDetailVO vo) {
		return mapper.updateNewsBoardDetail(vo);
	}
	@Override
	public int updateNewsBoardText(NewsBoardVO vo) {
		return mapper.updateNewsBoardText(vo);
	}
	@Override
	public int updateNewsBoardDetailText(NewsBoardDetailVO vo) {
		return mapper.updateNewsBoardDetailText(vo);
	}

}

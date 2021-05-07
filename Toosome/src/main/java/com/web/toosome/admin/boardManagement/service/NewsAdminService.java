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
		return mapper.searchNewsBoard(vo);
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
	public int deleteNewsBoard(Integer id) {
		return mapper.deleteNewsBoard(id);
	}
	@Override
	public int deleteNewsBoardDetail(Integer id) {
		return mapper.deleteNewsBoardDetail(id);
	}
	@Override
	public NewsBoardVO selectFile(Integer id) {
		return mapper.selectFile(id);
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
	@Override
	public List<NewsBoardVO> newsBoardDetail(NewsBoardVO vo) {
		return mapper.newsBoardDetail(vo);
	}
	@Override
	public NewsBoardDetailVO selectDFile(Integer id) {
		return mapper.selectDFile(id);
	}
	@Override
	public NewsBoardVO selectUpdateFile(NewsBoardVO vo) {
		return mapper.selectUpdateFile(vo);
	}
	@Override
	public NewsBoardDetailVO selectUpdateDFile(NewsBoardDetailVO vo) {
		return mapper.selectUpdateDFile(vo);
	}

}

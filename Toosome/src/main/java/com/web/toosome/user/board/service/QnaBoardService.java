package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.IQnaBoardMapper;
import com.web.toosome.user.board.vo.QnaBoardVO;

@Service
public class QnaBoardService implements IQnaBoardService {

	@Autowired
	private IQnaBoardMapper mapper;
	
	@Override
	public List<QnaBoardVO> getQnaBoardList(QnaBoardVO vo) {
	
		return mapper.getQnaBoardList(vo);
	}

	@Override
	public List<QnaBoardVO> getQnaBoardDetail(String index) {
		
		return mapper.getQnaBoardDetail(index);
	}

	@Override
	public void insertQnaBoard(QnaBoardVO vo) {
		mapper.insertQnaBoard(vo);	
	}

	@Override
	public QnaBoardVO passwordQnaBoard(Integer index) {
		System.out.println("qna 비밀번호 :" + mapper.passwordQnaBoard(index));
		return mapper.passwordQnaBoard(index);
	}

	@Override
	public void qnaBoardCount(String index) {
		mapper.qnaBoardCount(index);
	}

	@Override
	public List<QnaBoardVO> getSearchQnaBoard(String keyword) {
		
		return mapper.getSearchQnaBoard(keyword);
	}

	@Override
	public void insertQnaBoardText(QnaBoardVO vo) {
		mapper.insertQnaBoardText(vo);
		
	}

	@Override
	public List<QnaBoardVO> getQnaZeroComment(String index) {
		return mapper.getQnaZeroComment(index);
	}

}

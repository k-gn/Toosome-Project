package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardVO;

public interface IQnaBoardMapper {
	
	public List<QnaBoardVO> getQnaBoardList(QnaBoardVO vo);
	
	public List<QnaBoardVO> getQnaBoardDetail(String index);
	
	public void insertQnaBoard(QnaBoardVO vo);
	
	public QnaBoardVO passwordQnaBoard(Integer index);
	
	public void qnaBoardCount(String index);
	
	public List<QnaBoardVO> getSearchQnaBoard(String keyword);
}

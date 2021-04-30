package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardVO;

public interface IQnaBoardMapper {
	
	public List<QnaBoardVO> getQnaBoardList(QnaBoardVO vo);
	
	public List<QnaBoardVO> getQnaBoardDetail(String index);
	
	public List<QnaBoardVO> getQnaZeroComment(String index);
	
	public void insertQnaBoard(QnaBoardVO vo);
	
	public QnaBoardVO passwordQnaBoard(Integer index);
	
	public void qnaBoardCount(String index);
	
	public List<QnaBoardVO> getSearchQnaBoard(String keyword);
	
	// 해당 회원 qna 전체 삭제
	public void delQna(Integer id);
	
	public List<QnaBoardVO> getNewQnaList();
	
	public void insertQnaBoardText(QnaBoardVO vo);
}

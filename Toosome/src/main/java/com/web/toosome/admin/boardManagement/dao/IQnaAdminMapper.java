package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardCommentVO;
import com.web.toosome.user.board.vo.QnaBoardVO;
import com.web.toosome.user.board.vo.BoardSearchVO;

public interface IQnaAdminMapper {
	
	List<QnaBoardVO> qnaBoardList(QnaBoardVO vo);
	
	List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo);
	
	List<QnaBoardVO> searchQna(BoardSearchVO vo);
	
	int deleteQnaComment(Integer id);
	
	int deleteQna(Integer id);
	
	QnaBoardVO selectFile(Integer id);
	
	List<QnaBoardCommentVO> selectQnaComment(QnaBoardCommentVO vo);
	
	int insertQnaComment(QnaBoardCommentVO vo); 
	
	int updateQnaComment(QnaBoardCommentVO vo);
	
	int delQnaComment(QnaBoardCommentVO vo);

}

package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardVO;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.QnaBoardCommentVO;

public interface IQnaAdminService {
	
	List<QnaBoardVO> qnaBoardList(QnaBoardVO vo);
	
	List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo);
	
	List<QnaBoardVO> searchQna(BoardSearchVO vo);
	
	QnaBoardVO selectFile(Integer id);
	
	int deleteQna(Integer id);
	
	int deleteQnaComment(Integer id);
	
	int insertQnaComment(QnaBoardCommentVO vo);
	
	List<QnaBoardCommentVO> selectQnaComment(QnaBoardCommentVO vo);
}

package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardCommentVO;
import com.web.toosome.user.board.vo.QnaBoardVO;
import com.web.toosome.user.board.vo.BoardSearchVO;

public interface IQnaAdminMapper {
	
	List<QnaBoardVO> qnaBoardList(QnaBoardVO vo);
	
	List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo);
	
	List<QnaBoardVO> searchQna(BoardSearchVO vo);
	
	int deleteQnaComment(QnaBoardCommentVO vo);
	
	int deleteQna(QnaBoardVO vo);
	
	

}

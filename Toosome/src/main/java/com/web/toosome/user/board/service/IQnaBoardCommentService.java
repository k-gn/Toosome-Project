package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardCommentVO;

public interface IQnaBoardCommentService {
	
	List<QnaBoardCommentVO>qnaBoardCommentList(QnaBoardCommentVO vo);
	
	int insertQnaBoardComment(QnaBoardCommentVO vo);
	
	int updateQnaBoardComment(QnaBoardCommentVO vo);
	
	int deleteQnaBoardComment(QnaBoardCommentVO vo);

}

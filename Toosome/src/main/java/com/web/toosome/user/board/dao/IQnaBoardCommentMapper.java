package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardCommentVO;

public interface IQnaBoardCommentMapper {
	
	//댓글 리스트로 출력
	List<QnaBoardCommentVO> qnaBoardCommentList(QnaBoardCommentVO vo);
	
	//댓글 입력 
	int insertQnaBoardComment(QnaBoardCommentVO vo);
	
	//댓글 삭제
	int deleteQnaBoardComment(QnaBoardCommentVO vo);
	
	//댓글 수정
	int updateQnaBoardComment(QnaBoardCommentVO vo);
	
	//회원 댓글 삭제
	int delQnaCommentById(Integer id);

}

package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardVO;
import com.web.toosome.user.board.vo.BoardSearchVO;

public interface IQnaAdminService {
	
	List<QnaBoardVO> qnaBoardList(QnaBoardVO vo);
	
	List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo);
	
	List<QnaBoardVO> searchQna(BoardSearchVO vo);
}

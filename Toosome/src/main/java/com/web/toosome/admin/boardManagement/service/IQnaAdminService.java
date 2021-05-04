package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardVO;

public interface IQnaAdminService {
	
	List<QnaBoardVO> qnaBoardList(QnaBoardVO vo);
	
	List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo);

}

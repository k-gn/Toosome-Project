package com.web.toosome.admin.boardManagement.dao;

import java.util.List;
import com.web.toosome.user.board.vo.QnaBoardVO;

public interface IQnaAdminMapper {
	
	List<QnaBoardVO> qnaBoardList(QnaBoardVO vo);
	
	List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo);

}

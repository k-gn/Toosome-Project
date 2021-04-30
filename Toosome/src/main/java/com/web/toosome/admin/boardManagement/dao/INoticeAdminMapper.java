package com.web.toosome.admin.boardManagement.dao;

import java.util.List;

import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;

public interface INoticeAdminMapper {
	
	List<NoticeBoardVO> getNoticeBoard(NoticeBoardVO vo);
	
	List<NoticeBoardVO> searchNoticeBoard(BoardSearchVO vo);
	
	int insertNotice(NoticeBoardVO vo);
	
	int updateNotice(NoticeBoardVO vo);
	
	int deleteNotice(NoticeBoardVO vo);

}

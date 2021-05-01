package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import com.web.toosome.user.board.vo.NoticeBoardVO;

public interface INoticeAdminService {
	
	List<NoticeBoardVO> getNoticeBoard(NoticeBoardVO vo); 
	
	List<NoticeBoardVO> noticeDetail(NoticeBoardVO vo);
	
	int insertNotice(NoticeBoardVO vo);
	
	int updateNotice(NoticeBoardVO vo);
	
	int deleteNotice(NoticeBoardVO vo);

}

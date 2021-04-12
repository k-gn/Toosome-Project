package com.web.toosome.user.board.dao;

import java.util.List;

import com.web.toosome.user.board.vo.NoticeBoardVO;

public interface IBoardNoticeMapper {

	// 글목록 조회 기능
	
	public List<NoticeBoardVO> getNoticeBoardList(NoticeBoardVO noticeboard);

	// 해당 글 상세 조회
	
	public List<NoticeBoardVO> getNoticeBoard(String index);
	
	
	
	public void updateNoticeBoard(NoticeBoardVO noticeboard) ;
		


	public void deleteNoticeBoard(int noticeBoardId);
	
}
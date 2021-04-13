package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.NoticeBoardVO;

public interface IBoardNoticeService {
	
	//글목록 조회 기능
	public List<NoticeBoardVO> getNoticeBoardList(NoticeBoardVO vo) throws Exception;

	//해당글  조회
	public List<NoticeBoardVO> getNoticeBoard(String index) throws Exception;
	
	
	//글 조회수 증가
	public int NoticeBoardCount(String index)throws Exception;
	
	//글 추가
	public void insertNoticeBoard() throws Exception;
	
	//글 업데이트
	public void updateNoticeBoard(NoticeBoardVO noticeboard) throws Exception;
	
	//글 삭제
	public void deleteNoticeBoard(int noticeBoardId) throws Exception;

	//글 검색
	public List<NoticeBoardVO> getSearchNotice(String keyword) throws Exception;
	
	
	


}

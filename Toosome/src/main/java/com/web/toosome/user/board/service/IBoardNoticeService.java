package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.NoticeBoardVO;

public interface IBoardNoticeService {
	
	//글목록 조회 기능
	public List<NoticeBoardVO> getNoticeBoardList(NoticeBoardVO vo) throws Exception;

	//해당글  조회
	public NoticeBoardVO getBoard(NoticeBoardVO noticeboard) throws Exception;
	
	//글 추가
	public void insertNoticeBoardList() throws Exception;
	
	//글 업데이트
	public void update(NoticeBoardVO noticeboard) throws Exception;
	
	//글 삭제
	public void delete(int noticeBoardId) throws Exception;
	
	
	


}

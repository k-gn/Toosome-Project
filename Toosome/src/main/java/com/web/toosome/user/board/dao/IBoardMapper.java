package com.web.toosome.user.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.web.toosome.user.board.vo.NoticeBoardVO;

public interface IBoardMapper {

	// 조회 기능
	//@Select("select * from notice_board")
	public List<NoticeBoardVO> getBoardList();

	// 해당 글 상세 조회
	public void getBoard(NoticeBoardVO noticeboard);
	
	// 검색 기능
	
	// 
}

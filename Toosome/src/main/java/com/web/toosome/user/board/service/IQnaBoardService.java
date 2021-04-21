package com.web.toosome.user.board.service;

import java.util.List;

import com.web.toosome.user.board.vo.QnaBoardVO;

public interface IQnaBoardService {
	
	// qna게시판 리스트 출력
	public List<QnaBoardVO> getQnaBoardList(QnaBoardVO vo);
	
	//qna 게시물 세부정보 출력(index 번호 기준으로 앞뒤로 하나씩 3개 정보 보낼것) 이전글 다음글 기능 추가
	public List<QnaBoardVO> getQnaBoardDetail(String index);
	
	//qna 게시물 작성 기능
	public void insertQnaBoard(QnaBoardVO vo);
	
	//qna 게시물 비밀번호
	public QnaBoardVO passwordQnaBoard(Integer index);
	
}

package com.web.toosome.user.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.IBoardMapper;
import com.web.toosome.user.board.vo.NoticeBoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;

	
	
	
}

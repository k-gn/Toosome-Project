package com.web.toosome.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.board.dao.IQnaBoardCommentMapper;
import com.web.toosome.user.board.vo.QnaBoardCommentVO;

@Service
public class QnaBoardCommentService implements IQnaBoardCommentService{
	
	@Autowired
	private IQnaBoardCommentMapper mapper;
	
	@Override
	public List<QnaBoardCommentVO> qnaBoardCommentList(QnaBoardCommentVO vo) {
		return mapper.qnaBoardCommentList(vo);
	}

}

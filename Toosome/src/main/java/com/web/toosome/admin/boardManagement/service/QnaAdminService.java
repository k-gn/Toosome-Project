package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.IQnaAdminMapper;
import com.web.toosome.user.board.vo.QnaBoardVO;

@Service
public class QnaAdminService implements IQnaAdminService {

	@Autowired
	private IQnaAdminMapper mapper; 
	
	@Override
	public List<QnaBoardVO> qnaBoardList(QnaBoardVO vo) {
		return mapper.qnaBoardList(vo);
	}

	@Override
	public List<QnaBoardVO> qnaBoardDetail(QnaBoardVO vo) {
		return mapper.qnaBoardDetail(vo);
	}

}

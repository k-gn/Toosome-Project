package com.web.toosome.admin.mainManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.mainManagement.dao.IMainMapper;
import com.web.toosome.admin.mainManagement.vo.DailyVO;
import com.web.toosome.user.board.dao.IBoardNoticeMapper;
import com.web.toosome.user.board.dao.IQnaBoardMapper;
import com.web.toosome.user.board.vo.NoticeBoardVO;
import com.web.toosome.user.board.vo.QnaBoardVO;

@Service
public class MainService implements IMainService {
	
	@Autowired
	private IMainMapper mapper;
	
	@Autowired
	private IBoardNoticeMapper noticeMapper;
	
	@Autowired
	private IQnaBoardMapper qnaMapper;

	@Override
	public Integer getRegCount() {
		return mapper.getRegCount();
	}

	@Override
	public List<DailyVO> getDailyVisitInfo() {
		return mapper.getDailyVisitInfo();
	}

	@Override
	public List<NoticeBoardVO> getNewNoticeList() {
		return noticeMapper.getNewNoticeList();
	}

	@Override
	public List<QnaBoardVO> getNewQnaList() {
		return qnaMapper.getNewQnaList();
	}

	@Override
	public Integer getOrderCount() {
		return mapper.getOrderCount();
	}

}

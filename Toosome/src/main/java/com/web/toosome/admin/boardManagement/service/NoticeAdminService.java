package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.INoticeAdminMapper;
import com.web.toosome.user.board.vo.NoticeBoardVO;

@Service
public class NoticeAdminService implements INoticeAdminService {
	
	@Autowired
	private INoticeAdminMapper mapper;
	
	@Override
	public List<NoticeBoardVO> getNoticeBoard(NoticeBoardVO vo) {
		return mapper.getNoticeBoard(vo);
	}

}

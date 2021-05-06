package com.web.toosome.admin.boardManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.boardManagement.dao.INoticeAdminMapper;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;

@Service
public class NoticeAdminService implements INoticeAdminService {
	
	@Autowired
	private INoticeAdminMapper mapper;
	
	@Override
	public List<NoticeBoardVO> getNoticeBoard(NoticeBoardVO vo) {
		return mapper.getNoticeBoard(vo);
	}

	@Override
	public int insertNotice(NoticeBoardVO vo) {
		return mapper.insertNotice(vo);
	}

	@Override
	public int updateNotice(NoticeBoardVO vo) {
		return mapper.updateNotice(vo);
	}

	@Override
	public int deleteNotice(NoticeBoardVO vo) {
		return mapper.deleteNotice(vo);
	}

	@Override
	public List<NoticeBoardVO> noticeDetail(NoticeBoardVO vo) {
		return mapper.noticeDetail(vo);
	}

	@Override
	public List<NoticeBoardVO> searchNoticeBoard(BoardSearchVO vo) {
		return mapper.searchNoticeBoard(vo);
	}

}

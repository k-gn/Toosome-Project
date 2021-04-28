package com.web.toosome.admin.mainManagement.service;

import java.util.List;

import com.web.toosome.admin.mainManagement.vo.DailyVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;
import com.web.toosome.user.board.vo.QnaBoardVO;

public interface IMainService {
	
	public Integer getRegCount();
	
	public List<DailyVO> getDailyVisitInfo();
	
	public List<NoticeBoardVO> getNewNoticeList();
	
	public List<QnaBoardVO> getNewQnaList();
	
	public Integer getOrderCount();

}

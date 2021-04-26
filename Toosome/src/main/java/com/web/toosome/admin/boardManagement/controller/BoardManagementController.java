package com.web.toosome.admin.boardManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.admin.boardManagement.service.IEventAdminService;
import com.web.toosome.user.board.vo.EventBoardVO;

;

@Controller
public class BoardManagementController {
	
	@Autowired
	private IEventAdminService eventboardservice;
	
	//관리자 이벤트 게시판 검색 기능
	@GetMapping(value = "/admin/eventboardsearch" , produces = "application/json")
	@ResponseBody
	public List<EventBoardVO> searchEventBoard(String keyword){
		List<EventBoardVO> search = eventboardservice.searchEventBoard(keyword);
		System.out.println(search);
		return search;
	}
	
	
	
	//관리자 이벤트 게시판 리스트 값 
	@GetMapping(value = "/admin/eventboardmanagement" , produces = "application/json")// 이벤트 공지 게시판 진행중 이벤트 화면 값 넘기기
	@ResponseBody
	public List<EventBoardVO> EventBoardManagement(EventBoardVO vo){
		List<EventBoardVO> adminevent = eventboardservice.getEventBoard(vo);
		System.out.println(adminevent);
		return adminevent;
	}

	@RequestMapping("/admin/eventboard-management") // 이벤트 게시판 관리 뷰
	public String EventBoardManagementView() {
		return "adminpages/subpages/boardManagement/eventBoardManagement";
	}
	
	@GetMapping("/admin/noticeboard-management") // 공지사항 게시판 관리
	public String NoticeBoardManagement() {
		return "adminpages/subpages/boardManagement/noticeBoardManagement";
	}
	
	@GetMapping("/admin/newsboard-management") // 뉴스 게시판 관리
	public String NewsBoardManagement() {
		return "adminpages/subpages/boardManagement/newsBoardManagement";
	}
	
	@GetMapping("/admin/faqboard-management") // faq 게시판 관리
	public String FaqBoardManagement() {
		return "adminpages/subpages/boardManagement/faqBoardManagement";
	}
	
	@GetMapping("/admin/qnaboard-management") // qna 게시판 관리
	public String QnaBoardManagement() {
		return "adminpages/subpages/boardManagement/qnaBoardManagement";
	}
}

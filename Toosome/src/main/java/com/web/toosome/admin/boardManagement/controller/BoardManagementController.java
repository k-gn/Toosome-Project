package com.web.toosome.admin.boardManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardManagementController {

	@GetMapping("/admin/eventboard-management") // 이벤트 게시판 관리
	public String EventBoardManagement() {
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

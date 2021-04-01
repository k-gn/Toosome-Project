package com.web.toosome.user.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@GetMapping("/event") // 이벤트 공지 게시판
	public String event() {
		return "subpages/event/event";
	}
	
	@GetMapping("/event-detail")		// 이벤트 상세 페이지
	public String eventDetail() {
		return "subpages/event/eventDetail/eventDetail";
	}

	@GetMapping("/faq")
	public String faq() {
		return "subpages/faq/faq";
	}

	@GetMapping("/notice")
	public String notice() {
		return "subpages/notice/notice";
	}

	@GetMapping("/news")
	public String news() {
		return "subpages/news/news";
	}

	@GetMapping("/qna")
	public String qna() {
		return "subpages/qna/qna";
	}

	@GetMapping("/iat") // 성분분석표
	public String iat() {
		return "subpages/iat/iat";
	}

	@GetMapping("/notice-detail")	// notice 상세 페이지
	public String noticeDetail() {
		return "subpages/notice/noticeDetail/noticeDetail";
	}

	@GetMapping("/news-detail")		// news 상세 페이지
	public String newsDetail() {
		return "subpages/news/newsDetail/newsDetail";
	}

	@GetMapping("/qna-detail")		// qna 상세 페이지
	public String qnaDetail() {
		return "subpages/qna/qnaDetail/qnaDetail";
	}
	
	@GetMapping("/qna-enrollment")		// qna 등록 페이지
	public String qnaEnrollment() {
		return "subpages/qna/qnaEnrollment/qnaEnrollment";
	}
}

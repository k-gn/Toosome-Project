package com.web.toosome.user.board.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class BoardController {
	@GetMapping("/event") // 이벤트 공지 게시판
	public String event() {
		return "subpages/event/event";
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

	@GetMapping("/iat")   // 성분분석표
	public String iat() {
		return "subpages/iat/iat";
	}
}

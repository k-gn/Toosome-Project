package com.web.toosome.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.toosome.user.board.service.IFaqBoardService;
import com.web.toosome.user.board.vo.FaqBoardVO;

@Controller
public class BoardController {
	@GetMapping("/event") // 이벤트 공지 게시판
	public String event() {
		return "subpages/event/event";
	}
	
	@GetMapping("/event-detail") // 이벤트 상세 페이지
	public String eventDetail() {
		return "subpages/event/eventDetail/eventDetail";
	}
	
	@Autowired
	private IFaqBoardService faqBoardService;
	
	@GetMapping("/faq")
	public String faq(FaqBoardVO faqBoardVO, Model model) {
		System.out.println("FAQ 내용가져오기 : Controller");
		List<FaqBoardVO> faqBoardList = faqBoardService.getFaqBoardList(faqBoardVO);
		model.addAttribute("faqBoardList",faqBoardList);
		System.out.println(model);
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

	@GetMapping("/notice-detail") // notice 상세 페이지
	public String noticeDetail() {
		return "subpages/notice/noticeDetail/noticeDetail";
	}

	@GetMapping("/news-detail")	// news 상세 페이지
	public String newsDetail() {
		return "subpages/news/newsDetail/newsDetail";
	}

	@GetMapping("/qna-detail") // qna 상세 페이지
	public String qnaDetail() {
		return "subpages/qna/qnaDetail/qnaDetail";
	}
	
	@GetMapping("/qna-enrollment") // qna 등록 페이지
	public String qnaEnrollment() {
		return "subpages/qna/qnaEnrollment/qnaEnrollment";
	}
}

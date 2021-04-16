package com.web.toosome.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.toosome.user.board.service.IBoardNoticeService;
import com.web.toosome.user.board.service.IEventBoardService;
import com.web.toosome.user.board.service.IFaqBoardService;
import com.web.toosome.user.board.service.INewsBoardService;
import com.web.toosome.user.board.vo.EventBoardVO;
import com.web.toosome.user.board.vo.FaqBoardVO;
import com.web.toosome.user.board.vo.NewsBoardVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;

@Controller
public class BoardController {
	@Autowired
	private IFaqBoardService faqBoardService;
	
	@Autowired
	private IBoardNoticeService noticeBoardService;
	
	@Autowired
	private INewsBoardService newsBoardService;
	
	@Autowired
	private IEventBoardService eventBoardService;
	
	
	
	@RequestMapping(value = "/event") // 이벤트 공지 게시판 화면 주소넘기기
	public String eventView() {
		return "subpages/event/event";
	}
	
	@GetMapping(value = "/eventlist" , produces = "application/json")// 이벤트 공지 게시판 진행중 이벤트 화면 값 넘기기
	@ResponseBody
	public List<EventBoardVO> event(EventBoardVO vo)throws Exception{
		List<EventBoardVO> eventboardlist = eventBoardService.getEventBoard(vo);
		System.out.println("컨트롤러 이벤트 게시판 진행중 이벤트 리스트 값 : " + eventboardlist );
		return eventboardlist;
	}
	
	@GetMapping(value="/end-eventlist", produces= "application/json")//중료된 이벤트 게시판 리스트 화면 값 넘기기
	@ResponseBody
	public List<EventBoardVO> eventEnd(EventBoardVO vo)throws Exception{
		List<EventBoardVO> eventendlist = eventBoardService.getEndEventBoard(vo);
		System.out.println("컨트롤러 종료된 이벤트 게시판 리스트 값 : "  + eventendlist); 
		return eventendlist;
	}
	
	@RequestMapping("/event-detail") // 이벤트 상세 페이지 주소
	public String eventDetailView() {
		return "subpages/event/eventDetail/eventDetail";
	}
	
	@GetMapping(value = "/eventdetail", produces = "application/json")
	@ResponseBody
	public List<EventBoardVO> eventDetail(String index)throws Exception{
		List<EventBoardVO> eventboarddetail = eventBoardService.getEventBoardDetail(index);
		System.out.println("컨트롤러 이벤트 게시물 상세 값 " + eventboarddetail);
		eventBoardService.eventBoardCount(index); // 게시물 조회 수 증가
		return eventboarddetail;
	}
	
	@GetMapping(value = "/eventsearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<EventBoardVO> searchEvent(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<EventBoardVO> searchevent = eventBoardService.getSearchList(keyword);
		System.out.println("검색 값넘기기: " +searchevent);
		return searchevent;
		}else {
			return null;
		}
		
	}
	
	@GetMapping("/faq") //FAQ 게시판 목록 조회
	public String faq(FaqBoardVO faqBoardVO, Model model) {
		System.out.println("FAQ 내용가져오기 : Controller");
		List<FaqBoardVO> faqBoardList = faqBoardService.getFaqBoardList(faqBoardVO);
		model.addAttribute("faqBoardList",faqBoardList);
		System.out.println(model);
		return "subpages/faq/faq";
	}

	@RequestMapping(value = "/notice") //게시판 화면
	public String noticeView() {
		return "subpages/notice/notice";
	}
	
	@GetMapping(value = "/noticelist", produces = "application/json") // 게시판 목록 조회값
	@ResponseBody
	public List<NoticeBoardVO> notice(NoticeBoardVO noticeboardVO) throws Exception {
		System.out.println("공지사항 게시판 네용 보여주기 : Controller");
		List<NoticeBoardVO> noticeBoardList = noticeBoardService.getNoticeBoardList(noticeboardVO);
		System.out.println(noticeBoardList);
		return noticeBoardList;

	}
	
	@RequestMapping(value ="/notice-detail") //해당 게시물 상세 화면
	public String noticeDetailView(String index) throws Exception {
		
		System.out.println("notice-detail 화면 출력: " + index);
		return "subpages/notice/noticeDetail/noticeDetail";
	}
	
	
	@GetMapping(value = "/noticedetail", produces = "application/json") // 해당 게시물 조회값
	@ResponseBody
	public List<NoticeBoardVO> noticeDetail(String index) throws Exception {	
		List<NoticeBoardVO> noticeBoard = noticeBoardService.getNoticeBoard(index);
		noticeBoardService.NoticeBoardCount(index);
	
		
		System.out.println("index 값넘기기: " +noticeBoard);
		return noticeBoard;
	}
	
	
	@GetMapping(value = "/noticesearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<NoticeBoardVO> searchNotice(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<NoticeBoardVO> searchnotice = noticeBoardService.getSearchNotice(keyword);
		System.out.println("검색 값넘기기: " +searchnotice);
		return searchnotice;
		}else {
			return null;
		}
		
	}
	
	
	@RequestMapping("/news")  //뉴스 화면 띄우는 주소값
	public String newsView() {
		return "subpages/news/news";
	}

	@GetMapping(value = "/newslist", produces = "application/json") //뉴스화면리스트로 가는 값
	@ResponseBody
	public List<NewsBoardVO> news(NewsBoardVO vo)throws Exception{
		List<NewsBoardVO> newsboard = newsBoardService.getNewsBoardList(vo);
		System.out.println(newsboard);
		return newsboard;
	}
	
	@GetMapping(value = "/newssearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<NewsBoardVO> searchNews(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<NewsBoardVO> searchnews = newsBoardService.getSearchNews(keyword);
		System.out.println("검색 값넘기기: " +searchnews);
		return searchnews;
		}else {
			return null;
		}
		
	}
	
	
	@GetMapping("/qna")
	public String qna() {
		return "subpages/qna/qna";
	}

	@GetMapping("/iat") // 성분분석표
	public String iat() {
		return "subpages/iat/iat";
	}

	@RequestMapping("/news-detail")	// news 상세 페이지 화면
	public String newsDetailView() {
		return "subpages/news/newsDetail/newsDetail";
	}
	
	
	@GetMapping(value="/newsdetail", produces = "application/json" )
	@ResponseBody
	public List<NewsBoardVO> getNewsBoardDetail(String index)throws Exception{
		List<NewsBoardVO> newsdetail = newsBoardService.getNewsBoardDetail(index);
		System.out.println("newsdetail 넘어가는자료 "+ newsdetail);

		newsBoardService.newsBoardCount(index);
		return newsdetail;
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

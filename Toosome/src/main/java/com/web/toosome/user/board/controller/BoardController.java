package com.web.toosome.user.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.common.S3Service;
import com.web.toosome.user.board.service.IBoardNoticeService;
import com.web.toosome.user.board.service.IEventBoardService;
import com.web.toosome.user.board.service.IFaqBoardService;
import com.web.toosome.user.board.service.INewsBoardService;
import com.web.toosome.user.board.service.IQnaBoardCommentService;
import com.web.toosome.user.board.service.IQnaBoardService;
import com.web.toosome.user.board.vo.EventBoardVO;
import com.web.toosome.user.board.vo.FaqBoardVO;
import com.web.toosome.user.board.vo.NewsBoardVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;
import com.web.toosome.user.board.vo.QnaBoardCommentVO;
import com.web.toosome.user.board.vo.QnaBoardVO;
import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.AuthVO;
import com.web.toosome.user.member.vo.MemberVO;

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
	
	@Autowired
	private IQnaBoardService qnaBoardService;
	
	@Autowired
	private IQnaBoardCommentService qnaBoardCommentService;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private S3Service awsS3; 
	
	@RequestMapping(value = "/event") // 이벤트 공지 게시판 화면 주소넘기기
	public String eventView() {
		return "subpages/event/event";
	}
	
	@GetMapping(value = "/eventlist" , produces = "application/json")// 이벤트 공지 게시판 진행중 이벤트 화면 값 넘기기
	@ResponseBody
	public List<EventBoardVO> event(EventBoardVO vo)throws Exception{
		List<EventBoardVO> eventboardlist = eventBoardService.getEventBoard(vo);
		
		return eventboardlist;
	}
	
	@GetMapping(value="/end-eventlist", produces= "application/json")//중료된 이벤트 게시판 리스트 화면 값 넘기기
	@ResponseBody
	public List<EventBoardVO> eventEnd(EventBoardVO vo)throws Exception{
		List<EventBoardVO> eventendlist = eventBoardService.getEndEventBoard(vo);
		 
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
		
		eventBoardService.eventBoardCount(index); // 게시물 조회 수 증가
		return eventboarddetail;
	}
	
	@GetMapping(value = "/eventsearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<EventBoardVO> searchEvent(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<EventBoardVO> searchevent = eventBoardService.getSearchList(keyword);
		return searchevent;
		}else {
			return null;
		}
		
	}
	
	
	@GetMapping("/faq") //FAQ 게시판 목록 조회
	public String faq(FaqBoardVO faqBoardVO, Model model) {
		List<FaqBoardVO> faqBoardList = faqBoardService.getFaqBoardList(faqBoardVO);
		model.addAttribute("faqBoardList",faqBoardList);
		return "subpages/faq/faq";
	}
	
	@GetMapping(value = "/faqsearch", produces = "application/json") // 게시판 목록 조회값
	@ResponseBody
	public List<FaqBoardVO> faqSearch(String keyword){
		List<FaqBoardVO> search = faqBoardService.getFaqSearchBoardList(keyword);
		return search;
	}

	@RequestMapping(value = "/notice") //게시판 화면
	public String noticeView() {
		return "subpages/notice/notice";
	}
	
	@GetMapping(value = "/noticelist", produces = "application/json") // 게시판 목록 조회값
	@ResponseBody
	public List<NoticeBoardVO> notice(NoticeBoardVO noticeboardVO) throws Exception {
	
		List<NoticeBoardVO> noticeBoardList = noticeBoardService.getNoticeBoardList(noticeboardVO);
		
		return noticeBoardList;

	}
	
	@RequestMapping(value ="/notice-detail") //해당 게시물 상세 화면
	public String noticeDetailView(String index) throws Exception {
		return "subpages/notice/noticeDetail/noticeDetail";
	}
	
	
	@GetMapping(value = "/noticedetail", produces = "application/json") // 해당 게시물 조회값
	@ResponseBody
	public List<NoticeBoardVO> noticeDetail(String index) throws Exception {	
		List<NoticeBoardVO> noticeBoard = noticeBoardService.getNoticeBoard(index);
		noticeBoardService.NoticeBoardCount(index);
		
		return noticeBoard;
	}
	
	
	@GetMapping(value = "/noticesearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<NoticeBoardVO> searchNotice(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<NoticeBoardVO> searchnotice = noticeBoardService.getSearchNotice(keyword);
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
		return newsboard;
	}
	
	@GetMapping(value = "/newssearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<NewsBoardVO> searchNews(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<NewsBoardVO> searchnews = newsBoardService.getSearchNews(keyword);
		return searchnews;
		}else {
			return null;
		}
		
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
		
		newsBoardService.newsBoardCount(index);
		return newsdetail;
	}

	
	@RequestMapping("/qna") //qna 게시판 url값 리턴
	public String qnaView() {
		return "subpages/qna/qna";
	}
	
	@GetMapping(value="/qnalist", produces = "application/json" )
	@ResponseBody
	public List<QnaBoardVO> qnaList(QnaBoardVO vo){
		List<QnaBoardVO> qnalist = qnaBoardService.getQnaBoardList(vo);
		return qnalist;	
	}
	

	@PostMapping("/qna-detail") // qna 상세 페이지 주소값 리턴
	@ResponseBody
	public String qnaPassCheck(@RequestBody QnaBoardVO vo) {
		if (vo.getQnaBoardSecret() != 1) {
			return "success";
		} else {
			if (qnaBoardService.passwordQnaBoard(vo.getQnaBoardId()).getQnaBoardPassword().equals(vo.getQnaBoardPassword())) {
				return "success"; // 비밀글인데 암호맞음
			} else { // 비밀글인데 암호 틀린경우일경우
				return "fail";
			}
		}
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/qna-detail") // qna 상세 페이지 주소값 리턴
	public String qnaDetailView(String index) {
		return "subpages/qna/qnaDetail/qnaDetail";
	}

	@GetMapping(value="/qnadetail", produces = "application/json" ) //qna 상세페이지 값
	@ResponseBody
	public List<QnaBoardVO> qnaDetail(String index){
		
		List<QnaBoardVO> qnadetail = qnaBoardService.getQnaBoardDetail(index); //상세페이지 댓글 정보 가져오는값
		qnaBoardService.qnaBoardCount(index); // 조회수 증가
		return qnadetail;  
	}
	
	@GetMapping(value = "/qnasearch", produces = "application/json") // 게시판 검색기능
	@ResponseBody
	public List<QnaBoardVO> searchQna(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<QnaBoardVO> searchqna = qnaBoardService.getSearchQnaBoard(keyword);
		return searchqna;
		}else {
			return null;
		}
		
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping("/qna-enrollment") // qna 등록 페이지
	public String qnaEnrollmentView() {
		return "subpages/qna/qnaEnrollment/qnaEnrollment";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/qnaenrollment") // qna 등록 처리
	public String qnaEnrollment(MultipartFile uploadFile ,QnaBoardVO vo, RedirectAttributes ra) throws IllegalStateException, IOException {
		String uploadFolder = "https://thisisthat.s3.ap-mortheast-2.amazonaws.com/";

		if(vo.getUploadFile().getSize() != 0) {
		vo.setQnaBoardImageName(uploadFile.getOriginalFilename());
		qnaBoardService.insertQnaBoard(vo);

		//multipartFile 형식 파일을 file 형식으로 변환후  upload 
			File convFile = new File(uploadFile.getOriginalFilename());
			uploadFile.transferTo(convFile);
			File file = convFile;
			String key = "img/qnaImg/" + vo.getQnaBoardImageName();
			awsS3.upload(file, key);
		}
		
		if(vo.getUploadFile().getSize() == 0 ) {
			qnaBoardService.insertQnaBoardText(vo);
		}
		ra.addFlashAttribute("msg", "successBoard");
		
		return "redirect:/qna";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/qnacommentinsert")// qna 댓글입력
	public String qnaCommentinsert(QnaBoardCommentVO vo, RedirectAttributes ra, HttpSession session)throws Exception{
		int insert = qnaBoardCommentService.insertQnaBoardComment(vo);
		if(insert > 0) {
			ra.addFlashAttribute("msg", "insertSuccess");
		}else{
			ra.addFlashAttribute("msg", "insertFail");
		}
		MemberVO member = memberService.getUserById((Integer)session.getAttribute("id"));
		AuthVO auth = memberService.getAuthById((String)session.getAttribute("email"));
		return "redirect:/qna-detail?index=" + vo.getQnaQnaBoardId();
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/qnacommentupdate" , produces = "application/json")// qna 댓글 업데이트
	@ResponseBody
	public String qnaCommentUpdate(QnaBoardCommentVO vo)throws Exception{
		int update = qnaBoardCommentService.updateQnaBoardComment(vo);
		String msg = "";
		if(update > 0) {
			msg =  "updateSuccess";
		}else {
			msg =  "updateFail";
		}
		return msg;
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/qnacommentdelete" , produces = "application/json")// qna 댓글 삭제
	@ResponseBody
	public String qnaCommentDelete(QnaBoardCommentVO vo, RedirectAttributes ra)throws Exception{
		int delete = qnaBoardCommentService.deleteQnaBoardComment(vo);
		String msg = "";
		if(delete > 0) {
			msg =  "deleteSuccess";
		}else {
			msg =  "deleteFail";
		}
		return msg;
	}

}

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
	
	@RequestMapping(value = "/event") // ????????? ?????? ????????? ?????? ???????????????
	public String eventView() {
		return "subpages/event/event";
	}
	
	@GetMapping(value = "/eventlist" , produces = "application/json")// ????????? ?????? ????????? ????????? ????????? ?????? ??? ?????????
	@ResponseBody
	public List<EventBoardVO> event(EventBoardVO vo)throws Exception{
		List<EventBoardVO> eventboardlist = eventBoardService.getEventBoard(vo);
		
		return eventboardlist;
	}
	
	@GetMapping(value="/end-eventlist", produces= "application/json")//????????? ????????? ????????? ????????? ?????? ??? ?????????
	@ResponseBody
	public List<EventBoardVO> eventEnd(EventBoardVO vo)throws Exception{
		List<EventBoardVO> eventendlist = eventBoardService.getEndEventBoard(vo);
		 
		return eventendlist;
	}
	
	@RequestMapping("/event-detail") // ????????? ?????? ????????? ??????
	public String eventDetailView() {
		return "subpages/event/eventDetail/eventDetail";
	}
	
	@GetMapping(value = "/eventdetail", produces = "application/json")
	@ResponseBody
	public List<EventBoardVO> eventDetail(String index)throws Exception{
		List<EventBoardVO> eventboarddetail = eventBoardService.getEventBoardDetail(index);
		
		eventBoardService.eventBoardCount(index); // ????????? ?????? ??? ??????
		return eventboarddetail;
	}
	
	@GetMapping(value = "/eventsearch", produces = "application/json") // ????????? ????????????
	@ResponseBody
	public List<EventBoardVO> searchEvent(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<EventBoardVO> searchevent = eventBoardService.getSearchList(keyword);
		return searchevent;
		}else {
			return null;
		}
		
	}
	
	
	@GetMapping("/faq") //FAQ ????????? ?????? ??????
	public String faq(FaqBoardVO faqBoardVO, Model model) {
		List<FaqBoardVO> faqBoardList = faqBoardService.getFaqBoardList(faqBoardVO);
		model.addAttribute("faqBoardList",faqBoardList);
		return "subpages/faq/faq";
	}
	
	@GetMapping(value = "/faqsearch", produces = "application/json") // ????????? ?????? ?????????
	@ResponseBody
	public List<FaqBoardVO> faqSearch(String keyword){
		List<FaqBoardVO> search = faqBoardService.getFaqSearchBoardList(keyword);
		return search;
	}

	@RequestMapping(value = "/notice") //????????? ??????
	public String noticeView() {
		return "subpages/notice/notice";
	}
	
	@GetMapping(value = "/noticelist", produces = "application/json") // ????????? ?????? ?????????
	@ResponseBody
	public List<NoticeBoardVO> notice(NoticeBoardVO noticeboardVO) throws Exception {
	
		List<NoticeBoardVO> noticeBoardList = noticeBoardService.getNoticeBoardList(noticeboardVO);
		
		return noticeBoardList;

	}
	
	@RequestMapping(value ="/notice-detail") //?????? ????????? ?????? ??????
	public String noticeDetailView(String index) throws Exception {
		return "subpages/notice/noticeDetail/noticeDetail";
	}
	
	
	@GetMapping(value = "/noticedetail", produces = "application/json") // ?????? ????????? ?????????
	@ResponseBody
	public List<NoticeBoardVO> noticeDetail(String index) throws Exception {	
		List<NoticeBoardVO> noticeBoard = noticeBoardService.getNoticeBoard(index);
		noticeBoardService.NoticeBoardCount(index);
		
		return noticeBoard;
	}
	
	
	@GetMapping(value = "/noticesearch", produces = "application/json") // ????????? ????????????
	@ResponseBody
	public List<NoticeBoardVO> searchNotice(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<NoticeBoardVO> searchnotice = noticeBoardService.getSearchNotice(keyword);
		return searchnotice;
		}else {
			return null;
		}
		
	}
	
	
	@RequestMapping("/news")  //?????? ?????? ????????? ?????????
	public String newsView() {
		return "subpages/news/news";
	}

	@GetMapping(value = "/newslist", produces = "application/json") //???????????????????????? ?????? ???
	@ResponseBody
	public List<NewsBoardVO> news(NewsBoardVO vo)throws Exception{
		List<NewsBoardVO> newsboard = newsBoardService.getNewsBoardList(vo);
		return newsboard;
	}
	
	@GetMapping(value = "/newssearch", produces = "application/json") // ????????? ????????????
	@ResponseBody
	public List<NewsBoardVO> searchNews(String keyword) throws Exception {	
		
		if(keyword != null) {		
		List<NewsBoardVO> searchnews = newsBoardService.getSearchNews(keyword);
		return searchnews;
		}else {
			return null;
		}
		
	}
	
	
	@GetMapping("/iat") // ???????????????
	public String iat() {
		return "subpages/iat/iat";
	}

	@RequestMapping("/news-detail")	// news ?????? ????????? ??????
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

	
	@RequestMapping("/qna") //qna ????????? url??? ??????
	public String qnaView() {
		return "subpages/qna/qna";
	}
	
	@GetMapping(value="/qnalist", produces = "application/json" )
	@ResponseBody
	public List<QnaBoardVO> qnaList(QnaBoardVO vo){
		List<QnaBoardVO> qnalist = qnaBoardService.getQnaBoardList(vo);
		return qnalist;	
	}
	

	@PostMapping("/qna-detail") // qna ?????? ????????? ????????? ??????
	@ResponseBody
	public String qnaPassCheck(@RequestBody QnaBoardVO vo) {
		if (vo.getQnaBoardSecret() != 1) {
			return "success";
		} else {
			if (qnaBoardService.passwordQnaBoard(vo.getQnaBoardId()).getQnaBoardPassword().equals(vo.getQnaBoardPassword())) {
				return "success"; // ??????????????? ????????????
			} else { // ??????????????? ?????? ?????????????????????
				return "fail";
			}
		}
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/qna-detail") // qna ?????? ????????? ????????? ??????
	public String qnaDetailView(String index) {
		return "subpages/qna/qnaDetail/qnaDetail";
	}

	@GetMapping(value="/qnadetail", produces = "application/json" ) //qna ??????????????? ???
	@ResponseBody
	public List<QnaBoardVO> qnaDetail(String index){
		
		List<QnaBoardVO> qnadetail = qnaBoardService.getQnaBoardDetail(index); //??????????????? ?????? ?????? ???????????????
		qnaBoardService.qnaBoardCount(index); // ????????? ??????
		return qnadetail;  
	}
	
	@GetMapping(value = "/qnasearch", produces = "application/json") // ????????? ????????????
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
	@RequestMapping("/qna-enrollment") // qna ?????? ?????????
	public String qnaEnrollmentView() {
		return "subpages/qna/qnaEnrollment/qnaEnrollment";
	}
	

	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/qnaenrollment") // qna ?????? ??????
	public String qnaEnrollment(MultipartFile uploadFile ,QnaBoardVO vo, RedirectAttributes ra) throws IllegalStateException, IOException {
		String uploadFolder = "https://thisisthat.s3.ap-mortheast-2.amazonaws.com/";

		if(vo.getUploadFile().getSize() != 0) {
		vo.setQnaBoardImageName(uploadFile.getOriginalFilename());
		qnaBoardService.insertQnaBoard(vo);

		//multipartFile ?????? ????????? file ???????????? ?????????  upload 
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
	@PostMapping("/qnacommentinsert")// qna ????????????
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
	@GetMapping(value = "/qnacommentupdate" , produces = "application/json")// qna ?????? ????????????
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
	@GetMapping(value = "/qnacommentdelete" , produces = "application/json")// qna ?????? ??????
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

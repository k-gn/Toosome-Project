package com.web.toosome.admin.boardManagement.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.boardManagement.service.IEventAdminService;
import com.web.toosome.admin.boardManagement.service.IFaqAdminService;
import com.web.toosome.admin.boardManagement.service.INewsAdminService;
import com.web.toosome.admin.boardManagement.service.INoticeAdminService;
import com.web.toosome.admin.boardManagement.service.IQnaAdminService;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
import com.web.toosome.user.board.vo.EventBoardVO;
import com.web.toosome.user.board.vo.NewsBoardDetailVO;
import com.web.toosome.user.board.vo.NewsBoardVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;
import com.web.toosome.user.board.vo.FaqBoardVO;
import com.web.toosome.user.board.vo.QnaBoardVO;



@Controller
public class BoardManagementController {
	
	@Autowired
	private IEventAdminService eventboardservice;
	
	@Autowired
	private INoticeAdminService noticeboardservice;
	
	@Autowired
	private INewsAdminService newsadminservice;
	
	@Autowired
	private IFaqAdminService faqadminservice;
	
	@Autowired
	private IQnaAdminService qnaadminservice;
	
	@Autowired
	private S3Service awsS3;
	
	//관리자 이벤트 게시판 검색 기능
	
	@GetMapping(value = "/admin/eventboardsearch" , produces = "application/json")
	@ResponseBody
	public List<EventBoardVO> searchEventBoard(BoardSearchVO vo){
		List<EventBoardVO> search = eventboardservice.searchEventBoard(vo);;
		return search;
	}
	
	
	//관리자 이벤트 디테일 페이지  값
	@GetMapping(value = "/admin/eventdetail/{id}" , produces = "application/json")
	@ResponseBody
	public EventBoardVO eventBoardDetail(@PathVariable Integer id){
		EventBoardVO detail = eventboardservice.eventBoardDetail(id);
		return detail;
	}
	
	
	//관리자 이벤트 게시판 리스트 값 
	
	@GetMapping(value = "/admin/eventboardmanagement" , produces = "application/json")
	@ResponseBody
	public List<EventBoardVO> EventBoardManagement(EventBoardVO vo){
		List<EventBoardVO> adminevent = eventboardservice.getEventBoard(vo);
		return adminevent;
	}
	

	@RequestMapping("/admin/eventboard-management") // 이벤트 게시판 관리 뷰
	public String EventBoardManagementView() {
		return "adminpages/subpages/boardManagement/eventBoardManagement";
	}
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin/eventboard-insert") // 관리자 이벤트게시판 등록기능
	public String qnaEnrollment(EventBoardVO vo, EventBoardDetailVO vvo,RedirectAttributes ra) throws IllegalStateException, IOException {

		vo.setEventBoardImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
		vo.setEventBoardImageRoute("img/pages/subpages/event/");
		vo.setEventBoardImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
		
		vvo.setEventBoardDetailImageName(FilenameUtils.getBaseName(vvo.getUploadFile2().getOriginalFilename()));
		vvo.setEventBoardDetailImageRoute("img/pages/subpages/event/eventdetail");
		vvo.setEventBoardDetailImageExtention(FilenameUtils.getExtension(vvo.getUploadFile2().getOriginalFilename()));
		
		int in = eventboardservice.insertEvent(vo);
		int in2 = eventboardservice.insertDetailEvent(vvo);
		
		

		//multipartFile 형식 파일을 file 형식으로 변환후  upload 첫번쨰 이미지
			File convFile = new File(vo.getUploadFile().getOriginalFilename());
			vo.getUploadFile().transferTo(convFile);
			File file = convFile;
			String key = "img/pages/subpages/event/" + vo.getEventBoardImageName()+"."+vo.getEventBoardImageExtention();
			System.out.println(key);
			awsS3.upload(file, key);
			
		//두번쨰 이미지	
			File convFile2 = new File(vvo.getUploadFile2().getOriginalFilename());
			vvo.getUploadFile2().transferTo(convFile2);
			File file2 = convFile2;
			String key2 = "img/pages/subpages/event/eventdetail" + vvo.getEventBoardDetailImageName()+"."+vvo.getEventBoardDetailImageExtention();
			System.out.println(key2);
			awsS3.upload(file2, key2);
		
			
		if(in > 0 && in2 >0) {
				ra.addFlashAttribute("msg", "successBoard");	
		}else {
			ra.addFlashAttribute("msg", "failBoard");
		}
			
		return "redirect:/admin/eventboard-management";
	
	}
	
	
	@PostMapping("/admin/eventboard-delete/{id}") // 관리자 이벤트게시판 삭제기능
	public String eventdelete(@PathVariable Integer id, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		//이미지 삭제
		//1.셀렉트 구문으로 경로를 불러온다
		
		EventBoardVO vo = eventboardservice.selectIdFile(id); 
		EventBoardDetailVO vvo = eventboardservice.selectIdDetailFile(id);
		
		//2.vo로 연결해서 key 값에 경로를 넣는다 
		String key = vo.getEventBoardImageRoute()+vo.getEventBoardImageName()+"."+vo.getEventBoardImageExtention();
		String key2 = vvo.getEventBoardDetailImageRoute()+vvo.getEventBoardDetailImageName()+"."+vvo.getEventBoardDetailImageExtention();
		
		System.out.println("이벤트 게시판 이미지 경로" + key);
		System.out.println("이벤트 디테일 이미지 경로" + key2);
		
		//3.awsS3 delete 구문을 사용하여 파일을 제거한다.
		awsS3.delete(key);
		awsS3.delete(key2);
		
		
		// id 값을 받아서 delete 구문을 실행 시켜 db에서 자료를 삭제한다.
		int de = eventboardservice.deleteEvent(id);
		int de2 = eventboardservice.deleteDetailEvent(id);
		
		System.out.println("db에서 제거 완료");
		
			if(de>0 && de2 >0) {
					ra.addFlashAttribute("msg", "successDelete");		
			}else {
				ra.addFlashAttribute("msg", "failDelete");
			}	
			
		return "redirect:/admin/eventboard-management";
	}
	
	@PostMapping("/admin/eventboard-update") // 관리자 이벤트게시판 업데이트기능
	public String updateEvent(EventBoardVO vo, EventBoardDetailVO vvo, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		EventBoardVO ebvo = eventboardservice.selectFile(vo);
		EventBoardDetailVO ebvo2 = eventboardservice.selectDetailFile(vvo);
		
		
		if(vo.getUploadFile().getSize()!= 0) {
		
			String rote = ebvo.getEventBoardImageRoute()+ebvo.getEventBoardImageName()+"."+ebvo.getEventBoardImageExtention();
			awsS3.delete(rote);
			System.out.println("첫번쨰 파일 삭제 성공");
			vo.setEventBoardImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
			vo.setEventBoardImageRoute("img/pages/subpages/event/");
			vo.setEventBoardImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
			
			int up = eventboardservice.updateEvent(vo);
			
			File convFile = new File(vo.getUploadFile().getOriginalFilename());
			vo.getUploadFile().transferTo(convFile);
			File file = convFile;
			String key = "img/pages/subpages/event/" + vo.getEventBoardImageName()+"."+vo.getEventBoardImageExtention();
			System.out.println(key);
			awsS3.upload(file, key);
			
			if(up >0) {
				ra.addFlashAttribute("msg", "updateSuccess");
				}else {
					ra.addFlashAttribute("msg", "updateFail");
				}
		}
			
		
		if(vvo.getUploadFile2().getSize() != 0) {
			
			String rote2= ebvo2.getEventBoardDetailImageRoute()+ebvo2.getEventBoardDetailImageName()+"."+ebvo2.getEventBoardDetailImageExtention();
			awsS3.delete(rote2);
			System.out.println("두번쨰 파일 삭제 성공");
			vvo.setEventBoardDetailImageName(FilenameUtils.getBaseName(vvo.getUploadFile2().getOriginalFilename()));
			vvo.setEventBoardDetailImageRoute("img/pages/subpages/event/eventdetail");
			vvo.setEventBoardDetailImageExtention(FilenameUtils.getExtension(vvo.getUploadFile2().getOriginalFilename()));
			
			int up2 = eventboardservice.updateEventDetail(vvo);
			eventboardservice.updateEventText(vo);
			
			File convFile2 = new File(vvo.getUploadFile2().getOriginalFilename());
			vvo.getUploadFile2().transferTo(convFile2);
			File file2 = convFile2;
			String key2 = "img/pages/subpages/event/eventdetail" + vvo.getEventBoardDetailImageName()+"."+vvo.getEventBoardDetailImageExtention();
			System.out.println(key2);
			awsS3.upload(file2, key2);
		
			if(up2 > 0) {
				ra.addFlashAttribute("msg", "updateSuccess");
				}else {
					ra.addFlashAttribute("msg", "updateFail");
				}
		}
		
		if(vo.getUploadFile().getSize()== 0 && vvo.getUploadFile2().getSize() == 0) {
			eventboardservice.updateEventText(vo);
			ra.addFlashAttribute("msg", "updateSuccess");
		}
		
		
		System.out.println("DB 파일 update구문 완료");
			
		return "redirect:/admin/eventboard-management";
	}
	
	
	
	
	
	@RequestMapping("/admin/noticeboard-management") // 공지사항 게시판 관리
	public String NoticeBoardManagementView() {
		return "adminpages/subpages/boardManagement/noticeBoardManagement";
	}
	
	
	@GetMapping(value = "/admin/noticeboardmanagement" , produces = "application/json")// 공지사항 게시판 리스트 값 넘기기
	@ResponseBody
	public List<NoticeBoardVO> NoticeBoardManagement(NoticeBoardVO vo){
		List<NoticeBoardVO> adminnotice = noticeboardservice.getNoticeBoard(vo);
		System.out.println(adminnotice);
		return adminnotice;
	}
	
	@GetMapping(value = "/admin/noticeboarddetail" , produces = "application/json")// 공지사항 게시판 디테일 값 넘기기
	@ResponseBody
	public List<NoticeBoardVO> NoticeBoarddetail(NoticeBoardVO vo){
		List<NoticeBoardVO> noticedetail = noticeboardservice.noticeDetail(vo);
		System.out.println(noticedetail);
		return noticedetail;
	}
	
	@PostMapping(value = "/admin/noticeboard-insert")//공지사항 insert
	public String insertNotice(NoticeBoardVO vo, RedirectAttributes ra){
		
		int intsertnotice = noticeboardservice.insertNotice(vo);
		
		if(intsertnotice > 0) {
			ra.addFlashAttribute("msg", "successBoard");
		}else {
			ra.addFlashAttribute("msg", "failBoard");
		}			
		return "redirect:/admin/noticeboard-management";
	}
	
	@PostMapping(value = "/admin/noticeboard-update")//공지사항 update
	public String updateNotice(NoticeBoardVO vo, RedirectAttributes ra){
		
		int updatenotice = noticeboardservice.updateNotice(vo);
		
		if(updatenotice > 0) {
			ra.addFlashAttribute("msg", "updateSuccess");
		}else {
			ra.addFlashAttribute("msg", "updateFail");
		}			
		return "redirect:/admin/noticeboard-management";
	}
	
	@GetMapping(value = "/admin/noticeboard-delete")//공지사항 delete
	public String deleteNotice(NoticeBoardVO vo, RedirectAttributes ra){
		
		int deletenotice = noticeboardservice.deleteNotice(vo);
		
		if(deletenotice > 0) {
			ra.addFlashAttribute("msg", "deleteSuccess");
		}else {
			ra.addFlashAttribute("msg", "deleteFail");
		}			
		return "redirect:/admin/noticeboard-management";
	}
	
	@RequestMapping("/admin/newsboard-management") // 뉴스 게시판 관리
	public String NewsBoardManagementView() {
		return "adminpages/subpages/boardManagement/newsBoardManagement";
	}
	
	@GetMapping(value = "/admin/newsboardmanagement" , produces = "application/json")// 뉴스 관리자 게시물리스트 값
	@ResponseBody
	public List<NewsBoardVO> getEventList(NewsBoardVO vo){
		List<NewsBoardVO> eventlist = newsadminservice.getNewsList(vo);
		return eventlist;
	}
	
	@GetMapping(value="/admin/newsboarddetail" , produces = "application/json") // 뉴스관리자 게시물 상세보기값
	@ResponseBody
	public List<NewsBoardVO> newsBoardDetail(NewsBoardVO vo){
		List<NewsBoardVO> newsboarddetail = newsadminservice.newsBoardDetail(vo);
		return newsboarddetail;
	}
	
	
	@GetMapping(value="/admin/newsboardsearch" , produces = "application/json") // 뉴스관리자 게시물 검색기능
	@ResponseBody
	public List<NewsBoardVO> searchEventList(BoardSearchVO vo){
		List<NewsBoardVO> searchevent = newsadminservice.searchNewsBoard(vo);
		return searchevent;
	}
	
	@PostMapping(value="/admin/newsboard-insert") // 뉴스관리자 게시물 insert
	public String insertNews(NewsBoardVO vo, NewsBoardDetailVO vvo, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		vo.setNewsBoardImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
		vo.setNewsBoardImageRoute("img/pages/subpages/news/");
		vo.setNewsBoardImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
		
		vvo.setNewsBoardDetailImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
		vvo.setNewsBoardDetailImageRoute("img/pages/subpages/news/");
		vvo.setNewsBoardDetailImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
		
		int in = newsadminservice.insertNewsBoard(vo); 
		int in2 = newsadminservice.insertNewsBoardDetail(vvo);  
		
		
		//파일 변환 업로드	
		File convFile = new File(vo.getUploadFile().getOriginalFilename());
		vo.getUploadFile().transferTo(convFile);
		File file = convFile;
		String key = "img/pages/subpages/news/" + vo.getNewsBoardImageName()+"."+vo.getNewsBoardImageExtention();
		System.out.println(key);
		// 파일 업로드 메서드
		awsS3.upload(file, key);
		
		
		if(in > 0 && in2 > 0 ) {
			ra.addFlashAttribute("msg", "insertSeccess");
		}else {
			ra.addFlashAttribute("msg", "insertfail");
		}
		return "redirect:/admin/newsboard-management";
	}
	
	@PostMapping(value="/admin/newsboard-delete") // 이벤트 게시물 delete
	public String deleteNews(NewsBoardVO vo, NewsBoardDetailVO vvo, RedirectAttributes ra) {
	   
		//해당 파일 경로 정보
		NewsBoardVO selectfile = newsadminservice.selectFile(vo);
	
		//해당 파일 경로
		String key = selectfile.getNewsBoardImageRoute()+selectfile.getNewsBoardImageName()+"."+selectfile.getNewsBoardImageExtention();
		
		//파일제거 메서드
		awsS3.delete(key);
		
		int del = newsadminservice.deleteNewsBoard(vo);
		int del2 = newsadminservice.deleteNewsBoardDetail(vvo);
		
		if(del >0 && del2 >0) {
			ra.addFlashAttribute("msg", "deleteSeccess");
		}else {
			ra.addFlashAttribute("msg", "deletefail");
		}
		return "redirect:/admin/newsboard-management";
	}
	
	@PostMapping(value="/admin/newsboard-update") // 이벤트 게시물 update
	public String updateNews(NewsBoardVO vo, NewsBoardDetailVO vvo, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		//파일 조회후 삭제
		if(vo.getUploadFile().getSize() != 0) { //파일이 존재 할경우
		NewsBoardVO fvo = newsadminservice.selectFile(vo);
		String rote= fvo.getNewsBoardImageRoute()+fvo.getNewsBoardImageName()+"."+fvo.getNewsBoardImageExtention();
		awsS3.delete(rote);
		
		//DB 업데이트 구문 실행
		vo.setNewsBoardImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
		vo.setNewsBoardImageRoute("img/pages/subpages/news/");
		vo.setNewsBoardImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
		
		vvo.setNewsBoardDetailImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
		vvo.setNewsBoardDetailImageRoute("img/pages/subpages/news/");
		vvo.setNewsBoardDetailImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
		
		
		int up = newsadminservice.updateNewsBoard(vo);
		int up2 = newsadminservice.deleteNewsBoardDetail(vvo);
		
		File convFile = new File(vo.getUploadFile().getOriginalFilename());
		vo.getUploadFile().transferTo(convFile);
		File file = convFile;
		String key = "img/pages/subpages/news/" + vo.getNewsBoardImageName()+"."+vo.getNewsBoardImageExtention();
		System.out.println(key);
		awsS3.upload(file, key);
		if(up >0 && up2 > 0) {
		ra.addFlashAttribute("msg", "updateseccess");
		}else {
			ra.addFlashAttribute("msg", "updatefail");
		}
		}
		
		if(vo.getUploadFile().getSize() == 0) { //파일을 건드리지 않고 업데이트 할경우
			
		int up = newsadminservice.updateNewsBoardText(vo); 
		int up2= newsadminservice.updateNewsBoardDetailText(vvo);		
		
		
		if(up >0 && up2 > 0) {
			ra.addFlashAttribute("msg", "updateseccess");
			}else {
				ra.addFlashAttribute("msg", "updatefail");
			}	
		}
	
		return "redirect:/admin/newsboard-management";
	}
	
	@RequestMapping("/admin/faqboard-management") // faq 게시판 관리
	public String FaqBoardManagementView() {
		return "adminpages/subpages/boardManagement/faqBoardManagement";
	}
	
	@GetMapping(value = "/admin/faqboardmanagement" , produces = "application/json")
	@ResponseBody
	public List<FaqBoardVO> FaqBoardList(FaqBoardVO vo){ //faq 관리자 게시판 리스트 값
		List<FaqBoardVO> faqboardlist = faqadminservice.faqBoardList(vo);
		return faqboardlist;
	}
	
	@GetMapping(value = "/admin/faqboardsearch" , produces = "application/json")
	@ResponseBody
	public List<FaqBoardVO> faqSearch(BoardSearchVO vo){ // faq 관리자 게시판 검색기능
		List<FaqBoardVO> faqsearch = faqadminservice.faqSearch(vo);
		return faqsearch;
	}
	
	@GetMapping(value = "/admin/faqboarddetail" , produces = "application/json")
	@ResponseBody
	public List<FaqBoardVO> faqBoardDetail(FaqBoardVO vo){ // faq 관리자 게시판 상세정보
		List<FaqBoardVO> faqboarddetail = faqadminservice.faqBoardDetail(vo);
		return faqboarddetail;
	}
	
	@PostMapping(value = "/admin/faqboard-insert") // faq insert
	public String insertFaq(FaqBoardVO vo, RedirectAttributes ra) {
		int in = faqadminservice.insertFaq(vo);
		if(in>0) {
			ra.addFlashAttribute("msg", "insertseccess");
		}else {
			ra.addFlashAttribute("msg", "insertfail");
		}
		
		return "redirect:/admin/faqboard-management";
	}
	
	@PostMapping(value = "/admin/faqboard-delete") // faq delete
	public String deleteFaq(FaqBoardVO vo, RedirectAttributes ra) {
		int del = faqadminservice.deleteFaq(vo);
		if(del>0) {
			ra.addFlashAttribute("msg", "deleteseccess");
		}else {
			ra.addFlashAttribute("msg", "deletefail");
		}
		
		return "redirect:/admin/faqboard-management";
	}
	
	@PostMapping(value = "admin/faqboard-update") //faq update
	public String updateFaq(FaqBoardVO vo, RedirectAttributes ra) {
		int update = faqadminservice.updateFaq(vo);
		if(update>0) {
			ra.addFlashAttribute("msg", "updateseccess");
		}else {
			ra.addFlashAttribute("msg", "updatefail");
		}
		
		return "redirect:/admin/faqboard-management";
	}
	
	
	
	@RequestMapping("/admin/qnaboard-management") // qna 게시판 관리
	public String QnaBoardManagementView() {
		return "adminpages/subpages/boardManagement/qnaBoardManagement";
	}
	
	@GetMapping(value = "/admin/qnaboardmanagement" , produces = "application/json")
	@ResponseBody
	public List<QnaBoardVO> QnaBoardManagement(QnaBoardVO vo){
		List<QnaBoardVO> qnaboardlist = qnaadminservice.qnaBoardList(vo);	
		return qnaboardlist;
	}
	
	@GetMapping(value = "/admin/qnaboarddetail" , produces = "application/json")
	@ResponseBody
	public List<QnaBoardVO> QnaBoardDetail(QnaBoardVO vo){
		List<QnaBoardVO> qnaboarddetail = qnaadminservice.qnaBoardDetail(vo);
		return qnaboarddetail;
	}
}

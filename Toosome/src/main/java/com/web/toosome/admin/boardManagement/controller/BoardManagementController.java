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
import com.web.toosome.admin.boardManagement.service.INoticeAdminService;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
import com.web.toosome.user.board.vo.EventBoardVO;
import com.web.toosome.user.board.vo.NoticeBoardVO;



@Controller
public class BoardManagementController {
	
	@Autowired
	private IEventAdminService eventboardservice;
	
	@Autowired
	private INoticeAdminService noticeboardservice;
	
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
		System.out.println(detail);
		return detail;
	}
	
	
	//관리자 이벤트 게시판 리스트 값 
	
	@GetMapping(value = "/admin/eventboardmanagement" , produces = "application/json")// 이벤트 공지 게시판 진행중 이벤트 화면 값 넘기기
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
	public String eventdelete(EventBoardVO vo, EventBoardDetailVO vvo, @PathVariable Integer id, RedirectAttributes ra) throws IllegalStateException, IOException {

		
		int de = eventboardservice.deleteDetailEvent(id);
		int de2 = eventboardservice.deleteEvent(id);
		
		String key = vo.getEventBoardImageRoute()+vo.getEventBoardImageName()+"."+vo.getEventBoardImageExtention();
		String key2 = vvo.getEventBoardDetailImageRoute()+vvo.getEventBoardDetailImageName()+"."+vvo.getEventBoardDetailImageExtention();
		
		System.out.println("이벤트 게시판 이미지 경로" + key);
		System.out.println("이벤트 디테일 이미지 경로" + key2);
		
		awsS3.delete(key);
		awsS3.delete(key2);
		
			if(de>0 && de2 >0) {
					ra.addFlashAttribute("msg", "successBoard");		
			}else {
				ra.addFlashAttribute("msg", "failBoard");
			}	
			
		return "redirect:/admin/eventboard-management";
	}
	
	@PostMapping("/admin/eventboard-update") // 관리자 이벤트게시판 업데이트기능
	public String updateEvent(EventBoardVO vo, EventBoardDetailVO vvo, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		EventBoardVO ebvo = eventboardservice.selectFile(vo);
		EventBoardDetailVO ebvo2 = eventboardservice.selectDetailFile(vvo);
		
		System.out.println(ebvo +"파일1");
		System.out.println(ebvo2 +"파일2");
		if(vo.getUploadFile() != null || vvo.getUploadFile2() != null) {
		
			
			String rote = ebvo.getEventBoardImageRoute()+ebvo.getEventBoardImageName()+"."+ebvo.getEventBoardImageExtention();
		//	String rote2= ebvo2.getEventBoardDetailImageRoute()+ebvo2.getEventBoardDetailImageName()+"."+ebvo2.getEventBoardDetailImageExtention();
		
			
		System.out.println("이벤트 게시판 이미지 경로(지울거) " + rote);
	//	System.out.println("이벤트 디테일 이미지 경로 (지울거)" + rote2);
		
		awsS3.delete(rote);
		System.out.println("첫번쨰 파일 삭제 성공");
	//	awsS3.delete(rote2);
		System.out.println("두번쨰 파일 삭제 성공");
		
		vo.setEventBoardImageName(FilenameUtils.getBaseName(vo.getUploadFile().getOriginalFilename()));
		vo.setEventBoardImageRoute("img/pages/subpages/event/");
		vo.setEventBoardImageExtention(FilenameUtils.getExtension(vo.getUploadFile().getOriginalFilename()));
		
		vvo.setEventBoardDetailImageName(FilenameUtils.getBaseName(vvo.getUploadFile2().getOriginalFilename()));
		vvo.setEventBoardDetailImageRoute("img/pages/subpages/event/eventdetail");
		vvo.setEventBoardDetailImageExtention(FilenameUtils.getExtension(vvo.getUploadFile2().getOriginalFilename()));
		
		int up = eventboardservice.updateEvent(vo);
		int up2 = eventboardservice.updateEventDetail(vvo);
		
		System.out.println("DB 파일 update구문 완료");
		//ra.addFlashAttribute("msg", "successBoard");

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
			
			if(up >0 && up2>0) {
				ra.addFlashAttribute("msg", "successBoard");
			}else {
				ra.addFlashAttribute("msg", "failBoard");
			}
		}
			
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

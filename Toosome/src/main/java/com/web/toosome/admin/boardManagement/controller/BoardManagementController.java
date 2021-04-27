package com.web.toosome.admin.boardManagement.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.toosome.admin.boardManagement.service.IEventAdminService;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.board.vo.BoardSearchVO;
import com.web.toosome.user.board.vo.EventBoardDetailVO;
import com.web.toosome.user.board.vo.EventBoardVO;

;

@Controller
public class BoardManagementController {
	
	@Autowired
	private IEventAdminService eventboardservice;
	
	@Autowired
	private S3Service awsS3;
	
	//관리자 이벤트 게시판 검색 기능
	
	@GetMapping(value = "/admin/eventboardsearch" , produces = "application/json")
	@ResponseBody
	public List<EventBoardVO> searchEventBoard(BoardSearchVO vo){
		List<EventBoardVO> search = eventboardservice.searchEventBoard(vo);
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
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin/eventboard-insert") // 관리자 이벤트게시판 등록기능
	public String qnaEnrollment(MultipartFile uploadFile ,MultipartFile uploadFile2 ,EventBoardVO vo, EventBoardDetailVO vvo,RedirectAttributes ra) throws IllegalStateException, IOException {
		
		String uploadFolder = "https://thisisthat.s3.ap-mortheast-2.amazonaws.com/";

		System.out.println("이벤트 게시판.getUploadFile 값 : "+vo.getUploadFile());
		System.out.println("이벤트 디테일 /getUpliadFile 값 :" + vvo.getUploadFile2());
		
		vo.setEventBoardImageName(uploadFile.getOriginalFilename());
		vvo.setEventBoardDetailImageName(uploadFile2.getOriginalFilename());
		
		eventboardservice.insertEvent(vo);
		eventboardservice.insertDetailEvent(vvo);
		
		ra.addFlashAttribute("msg", "successBoard");

		//multipartFile 형식 파일을 file 형식으로 변환후  upload 첫번쨰 이미지
			File convFile = new File(uploadFile.getOriginalFilename());
			uploadFile.transferTo(convFile);
			File file = convFile;
			String key = "img/pages/subpages/event/" + vo.getEventBoardImageName();
			System.out.println(key);
			awsS3.upload(file, key);
			
		//두번쨰 이미지	
			File convFile2 = new File(uploadFile2.getOriginalFilename());
			uploadFile2.transferTo(convFile2);
			File file2 = convFile2;
			String key2 = "img/pages/subpages/event/" + vvo.getEventBoardDetailImageName();
			System.out.println(key2);
			awsS3.upload(file2, key2);
		
		return "redirect:/admin/eventboard-management";
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

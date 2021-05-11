package com.web.toosome.user.reviewboard.controller;

public class ReviewBoardController {
/*
	@Autowired
	private IReviewBoardService reviewBoardService;

	// 댓글 리스트
	@RequestMapping(value = "/review-list", produces = "application/json; charset=UTF-8")
	public List<ReviewBoardVO> reviewBoardList(@RequestParam int productId, Model model) throws Exception {
		System.out.println("댓글리스트 출력");
		List<ReviewBoardVO> reviewBoardList = reviewBoardService.reviewListService(productId);

		return reviewBoardList;// List<ReviewBoardVO> 객체(reviewBoardList) 전달
	}

	// 댓글 작성
	@RequestMapping(value = "/review-insert", produces = "application/json; charset=UTF-8")
	public int reviewBoardInsert(ReviewBoardVO reviewBoardVO, HttpSession session) throws Exception {
		System.out.println("댓글 등록 처리");
		reviewBoardVO.setReviewBoardWriter((String) session.getAttribute("id"));
		return reviewBoardService.reviewInsertService(reviewBoardVO);
	}


	// 댓글 수정 GET
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdate(ReviewBoardVO reviewBoardVO,  Model model) throws Exception {


		model.addAttribute("reviewUpdateService", reviewBoardService.reviewCount(reviewBoardVO.getReviewBoardId()));

		return "subpages/product/productDetail/productDetail";
	}

	// 댓글 수정 POST
	@RequestMapping(value="/reviewUpdate", method = RequestMethod.POST)
		public String reviewUpdate(ReviewBoardVO reviewBoardVO, RedirectAttributes rttr) throws Exception {
			
			reviewBoardService.reviewUpdateService(reviewBoardVO);
			
			rttr.addAttribute("productId", reviewBoardVO.getProductId());
			
			return "redirect:/subpages/product/productDetail/productDetail";
	}

	
	//댓글 삭제 GET
		@RequestMapping(value="/reviewDelete", method = RequestMethod.GET)
		public String replyDelete(ReviewBoardVO reviewBoardVO, Model model) throws Exception {
			
			model.addAttribute("replyDelete", reviewBoardService.reviewCount(reviewBoardVO.getReviewBoardId()));
			

			return "subpages/product/productDetail/productDetail";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReviewBoardVO reviewBoardVO, RedirectAttributes rttr) throws Exception {
			
			reviewBoardService.reviewDeleteService(reviewBoardVO);
			
			rttr.addAttribute("productId", reviewBoardVO.getProductId());
		
			return "redirect:/subpages/product/productDetail/productDetail";
		}
*/		
}

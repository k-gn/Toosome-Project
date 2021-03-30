package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/agreement")
	public String agreement() {
		return "subpages/agreement/agreement";
	}
	@GetMapping("/signin")
	public String signin() {
		return "subpages/signin/signin";
	}
	@GetMapping("/signup")
	public String signup() {
		return "subpages/signup/signup";
	}
	@GetMapping("/brandstory")
	public String brand() {
		return "subpages/brandstory/brandStory";
	}
	@GetMapping("/event")
	public String event() {
		return "subpages/event/event";
	}
	@GetMapping("/menu")
	public String menu() {
		return "subpages/menu/menu";
	}
	@GetMapping("/coffeestory")
	public String coffeestory() {
		return "subpages/coffeeStory/coffeeStory";
	}
	@GetMapping("/dessertstory")
	public String dessertStory() {
		return "subpages/dessertStory/dessertStory";
	}
	@GetMapping("/brandfilm")
	public String brandFilm() {
		return "subpages/brandFilm/brandFilm";
	}
	@GetMapping("/admin")
	public String admin() {
		return "adminpages/index";
	}
	@GetMapping("/franchise")
	public String franchise() {
		return "subpages/franchise/franchise";
  }
	@GetMapping("/faq")
	public String faq() {
		return "subpages/faq/faq";
	}
	@GetMapping("/notice")
	public String notice() {
		return "subpages/notice/notice";
	}
	@GetMapping("/notice-detail")
	public String noticeDetail() {
		return "subpages/notice/noticeDetail/noticeDetail";
	}
	@GetMapping("/news")
	public String news() {
		return "subpages/news/news";
	}
	@GetMapping("/news-detail")
	public String newsDetail() {
		return "subpages/news/newsDetail/newsDetail";
	}
	@GetMapping("/qna")
	public String qna() {
		return "subpages/qna/qna";
	}
	@GetMapping("/qna-detail")
	public String qnaDetail() {
		return "subpages/qna/qnaDetail/qnaDetail";
	}
	@GetMapping("/testsns")
	public String testsns() {
		return "testsns";
	}
	@GetMapping("/franchisepay")
	public String franchisepay() {
		return "subpages/franchisePay/franchisePay";
	}
	@GetMapping("/explanation")
	public String explanation() {
		return "subpages/explanation/explanation";
	}
	@GetMapping("/sitemap")
	public String sitemap() {
		return "subpages/siteMap/siteMap";
	}
	@GetMapping("/map")
	public String map() {
		return "subpages/map/map";
	}
}

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
<<<<<<< .merge_file_a23840
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
=======
	@GetMapping("/franchise")
	public String franchise() {
		return "subpages/franchise/franchise";
>>>>>>> .merge_file_a16312
	}
}

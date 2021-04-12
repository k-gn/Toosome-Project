package com.web.toosome.user.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.web.toosome.user.login.common.LoginUtil;
import com.web.toosome.user.login.naver.NaverLoginBO;
import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private NaverLoginBO naverLoginBO;

	@Autowired
	private IMemberService service;
	
	@Autowired
	private LoginUtil loginUtil;

	@GetMapping("/signin")
	public String signin() {
		return "subpages/signin/signin";
	}

	// naver login
	@GetMapping("/nsignin")
	@ResponseBody
	public String naverSignin(HttpSession session, Model model) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		return naverAuthUrl;
	}

	// naver login proc
	@GetMapping("/nsignproc")
	public String naverSignin(Model model, String code, String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(naverLoginBO.getUserProfile(oauthToken));
		jsonObject = (JSONObject) jsonObject.get("response");
		String email = (String) jsonObject.get("email");
		String name = (String) jsonObject.get("name");
		MemberVO member = service.getUserByEmail(email);
		if (member == null) {
			member = new MemberVO();
			member.setMemberEmail(email);
			member.setMemberName(name);
			member.setPlatFormType("naver");
			service.registerMember(member);
		}
		loginUtil.loginWithoutForm(email);
		session.setAttribute("member", member);
		return "redirect:/";
	}

	@GetMapping("/admin/signin")
	public String adminsignin() {
		return "adminpages/subpages/login/adminLogin";
	}

	@GetMapping("/find-id")
	public String findId() {
		return "subpages/signin/findId/findId";
	}

	@GetMapping("/find-pwd")
	public String findPwd() {
		return "subpages/signin/findPwd/findPwd";
	}

	// access denied control
	@GetMapping("/accessErrorAdmin")
	public String accessDeniedAdmin(Authentication auth, Model model) {
		return "redirect:/";
	}

	@GetMapping("/accessErrorMember")
	public String accessDeniedMember(Authentication auth, Model model) {
		return "redirect:/";
	}

	// login fail control
	@GetMapping("/loginFailMember")
	public String loginFailMember(RedirectAttributes ra, String error) {
		ra.addFlashAttribute("loginFailMsg", error);
		return "redirect:/signin";
	}

	@GetMapping("/loginFailAdmin")
	public String loginFailAdmin(RedirectAttributes ra, String error) {
		ra.addFlashAttribute("loginFailMsg", error);
		return "redirect:/admin/signin";
	}
}

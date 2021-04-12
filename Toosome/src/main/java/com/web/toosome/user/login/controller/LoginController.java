package com.web.toosome.user.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.web.toosome.user.login.common.LoginUtil;
import com.web.toosome.user.login.kakao.KakaoLoginApi;
import com.web.toosome.user.login.kakao.KakaoUserInfo;
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
	public void naverSignin(String code, String state, HttpSession session, HttpServletResponse response) throws Exception {
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
		} else if(email.equals(member.getMemberEmail()) && "kakao".equals(member.getPlatFormType())) {
			service.updatePlatForm(email, "naver");
			member = service.getUserByEmail(email);
		}
		
		loginUtil.loginWithoutForm(email);
		session.setAttribute("member", member);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>window.opener.location.href='/';self.close();</script>");
		out.flush();
	}
	
	// kakao login
	@GetMapping("/ksignin")
	@ResponseBody
	public String kakaoSignin() {
		return KakaoLoginApi.getAuthorizationUrl();
	}
	
	// kakao login proc
	@GetMapping("/ksignproc") 
	public void kakaoSignin(String code ,HttpServletResponse response, HttpSession session) throws Exception {
		JsonNode accessToken;
		 
        // JsonNode트리형태로 토큰받아온다
        JsonNode jsonToken = KakaoLoginApi.getKakaoAccessToken(code);
        // 여러 json객체 중 access_token을 가져온다
        accessToken = jsonToken.get("access_token");
        // access_token을 통해 사용자 정보 요청
        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        String name = properties.path("nickname").asText();
        String email = kakao_account.path("email").asText();
        MemberVO member = service.getUserByEmail(email);
		if (member == null) {
			member = new MemberVO();
			member.setMemberEmail(email);
			member.setMemberName(name);
			member.setPlatFormType("kakao");
			service.registerMember(member);
		}else if(email.equals(member.getMemberEmail()) && "naver".equals(member.getPlatFormType())) {
			service.updatePlatForm(email, "kakao");
			member = service.getUserByEmail(email);
		}
		
		loginUtil.loginWithoutForm(email);
		session.setAttribute("member", member);

        PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>window.opener.location.href='/';self.close();</script>");
		out.flush();
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


package com.web.toosome.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.vo.MemberVO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private IMemberMapper mapper;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String url = "/";
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Collection<GrantedAuthority> authCollection = user.getAuthorities();
		Iterator<GrantedAuthority> authList = authCollection.iterator();
		
		while(authList.hasNext()) {
			GrantedAuthority authority= authList.next();
			if(authority.getAuthority().equals("ROLE_HEAD") | authority.getAuthority().equals("ROLE_ADMIN")) {
				url="/admin";
			}
		}
		
		MemberVO member = mapper.getUserByEmail(authentication.getName());
		session.setAttribute("id", member.getMemberId());
		response.sendRedirect(url);
	}

}

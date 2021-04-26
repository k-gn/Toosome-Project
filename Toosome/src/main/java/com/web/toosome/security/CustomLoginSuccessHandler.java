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
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.vo.MemberVO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private IMemberMapper mapper;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberVO member = mapper.getUserByEmail(authentication.getName());
		if(member.getStatus() == 3) {
			session.setAttribute("state", 3);
		}else if(member.getStatus() == 2) {
			session.setAttribute("state", 2);
		}
		
		mapper.updateLastLogin(authentication.getName());
		session.setAttribute("id", member.getMemberId());
		session.setAttribute("email", member.getMemberEmail());
		
		resultRedirectStrategy(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
		boolean flag = false;
		
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        CustomUser user = (CustomUser)authentication.getPrincipal();
		Collection<GrantedAuthority> authCollection = user.getAuthorities();
		Iterator<GrantedAuthority> authList = authCollection.iterator();
		
		while(authList.hasNext()) {
			GrantedAuthority authority= authList.next();
			if(authority.getAuthority().equals("ROLE_HEAD") | authority.getAuthority().equals("ROLE_ADMIN")) {
				flag = true;
			}
		}
        
		if(flag) {
			redirectStratgy.sendRedirect(request, response, "/admin");
		}else {
			if(savedRequest != null) {
				String targetUrl = savedRequest.getRedirectUrl();
				redirectStratgy.sendRedirect(request, response, targetUrl);
			} else {
				redirectStratgy.sendRedirect(request, response, "/");
			}
		}
		
    }
}

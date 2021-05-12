package com.web.toosome.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		String uri = request.getRequestURI();
		String referer = request.getHeader("Referer");
		if(request.getQueryString() != null) {
			uri = uri + "?" + request.getQueryString();
			referer = referer + "?" + request.getQueryString();
		}
		
		if(referer != null && referer.contains("Detail")) {
			System.out.println(referer);
			request.getSession().setAttribute("prevURI", referer);
		}else {
			request.getSession().setAttribute("prevURI", uri);
		}
		
		if(uri.contains("admin")) {
			response.sendRedirect("/admin/signin");
		} else {
			response.sendRedirect("/signin?error");
		}
	}

}

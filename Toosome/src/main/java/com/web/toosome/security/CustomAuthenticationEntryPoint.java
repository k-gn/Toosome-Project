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
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevURI", referer);
		String uri = request.getRequestURI();
		if(uri.contains("admin")) {
			response.sendRedirect("/admin/signin");
		} else {
			response.sendRedirect("/signin?error");
		}
	}

}

package com.web.toosome.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
        String uri = request.getRequestURI();
        if(uri.contains("admin")) {
            response.sendRedirect("/accessErrorAdmin");
        } else {
            response.sendRedirect("/accessErrorMember");
        }
	}
}

package com.web.toosome.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;

public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		System.out.println("loginFail : " + exception);
		String error = "";
		if (exception instanceof AuthenticationServiceException) {
			error = "존재하지 않는 사용자입니다.";
		} else if(exception instanceof BadCredentialsException) {
			error = "아이디 또는 비밀번호가 틀립니다.";
		} else if(exception instanceof LockedException) {
			error = "잠긴 계정입니다.";
		} else if(exception instanceof DisabledException) {
			error = "비활성화된 계정입니다.";
		}  else if(exception instanceof SessionAuthenticationException) {
			error = "duplogin";
		} 	
		
		String errorMsg = URLEncoder.encode(error, "UTF-8");
		String uri = request.getRequestURI();
		if(uri.contains("admin")) {
			response.sendRedirect("/loginFailAdmin?error=" + errorMsg + "&id=" + request.getParameter("adminId"));
		} else {
			response.sendRedirect("/loginFailMember?error=" + errorMsg + "&id=" + request.getParameter("memberEmail"));
		}
	}

}

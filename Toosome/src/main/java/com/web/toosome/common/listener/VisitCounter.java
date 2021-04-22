package com.web.toosome.common.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.toosome.admin.mainManagement.service.IVisiterService;
import com.web.toosome.admin.mainManagement.vo.VisiterVO;

public class VisitCounter implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		 HttpSession session = se.getSession();
         WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
         ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
         IVisiterService service = (IVisiterService) wac.getBean("visiterService");
         HttpServletRequest req = attr.getRequest();
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
         VisiterVO vo = new VisiterVO();
         vo.setVisitIp(req.getRemoteAddr());
         service.insertVisitor(vo);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
}

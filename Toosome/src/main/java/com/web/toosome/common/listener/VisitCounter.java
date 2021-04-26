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
         ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
         HttpServletRequest req = attr.getRequest();
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
         VisiterVO vo = new VisiterVO();
         vo.setVisitIp(req.getRemoteAddr());
         getVisitorService(se).insertVisitor(vo);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

	}

	private IVisiterService getVisitorService(HttpSessionEvent se) {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(se.getSession().getServletContext());
		return (IVisiterService) context.getBean("visiterService");
	}
}

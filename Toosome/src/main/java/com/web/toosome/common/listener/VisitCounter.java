package com.web.toosome.common.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.toosome.admin.mainManagement.service.IVisitorService;
import com.web.toosome.admin.mainManagement.vo.VisitorVO;

public class VisitCounter implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {

		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = attr.getRequest();
		IVisitorService service = getVisitorService(se);
		if (service.getVisitInfo(req.getRemoteAddr()) == null) {
			service.setTimezone();
			VisitorVO vo = new VisitorVO();
			vo.setVisitIp(req.getRemoteAddr());
			service.insertVisitor(vo);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

	private IVisitorService getVisitorService(HttpSessionEvent se) {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(se.getSession().getServletContext());
		return (IVisitorService) context.getBean("visiterService");
	}
}

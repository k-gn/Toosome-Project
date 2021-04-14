package com.web.toosome.user.login.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;

@Component
public class LoginUtil {
	
	@Autowired
	private IMemberService service;

	public void loginWithoutForm(String email) {
		MemberVO member = service.getUserByEmail(email);
		String roleStr = member.getAuthList().get(0).getMemberAuth();
		List<GrantedAuthority> roles = new ArrayList<>(1);
		roles.add(new SimpleGrantedAuthority(roleStr));
		Authentication auth = new UsernamePasswordAuthenticationToken(member, null, roles);
		SecurityContextHolder.getContext().setAuthentication(auth);
	}
	
	public boolean socialLoginProc(String email, String name, String type, MemberVO member) {
		boolean flag = false;
		if (member == null) {
			member = new MemberVO();
			member.setMemberEmail(email);
			member.setMemberName(name);
			member.setPlatFormType(type);
			service.registerMember(member);
			return flag;
		} else if(email.equals(member.getMemberEmail()) && !type.equals(member.getPlatFormType())) {
			System.out.println("change platform");
			service.updatePlatForm(email, type);
			return flag;
		} else if(email.equals(member.getMemberEmail()) && member.getPlatFormType() == null){
			System.out.println("duplicate email");
			flag = true;
			return flag;
		}
		return flag;
	}
}

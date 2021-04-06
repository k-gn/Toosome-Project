package com.web.toosome.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.web.toosome.user.member.vo.MemberVO;

public class CustomUser extends User {

	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberVO member) {
		super(member.getMemberEmail(), member.getMemberPassword(), member.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getMemberAuth())).collect(Collectors.toList()));

		this.member = member;
	}
}

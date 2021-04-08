package com.web.toosome.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.vo.MemberVO;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private IMemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO member = mapper.getUserByEmail(username);
		if(member == null) {
			 throw new UsernameNotFoundException("username " + username + " not found");
		}
		System.out.println("**************Found user***************");
		System.out.println("id : " + member.getMemberEmail());
		return member == null ? null : new CustomUser(member);
	}
}

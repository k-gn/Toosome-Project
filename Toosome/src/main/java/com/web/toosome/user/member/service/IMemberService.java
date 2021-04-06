package com.web.toosome.user.member.service;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberService {

	public boolean emailDupCheck(String email);

	public void register(MemberVO member);

	public MemberVO getUserByEmail(String email);
}

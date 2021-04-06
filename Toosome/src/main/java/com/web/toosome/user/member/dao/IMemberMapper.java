package com.web.toosome.user.member.dao;

import com.web.toosome.user.member.vo.MemberVO;

public interface IMemberMapper {

	public Integer emailDupCheck(String email);

	public void register(MemberVO member);

	public MemberVO getUserByEmail(String email);
}

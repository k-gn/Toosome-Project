package com.web.toosome.user.member.vo;

import lombok.Data;

@Data
public class AuthVO {

	private String memberEmail;
	private String memberAuth;
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(String memberAuth) {
		this.memberAuth = memberAuth;
	}
	@Override
	public String toString() {
		return "AuthVO [memberEmail=" + memberEmail + ", memberAuth=" + memberAuth + "]";
	}
	
	
}

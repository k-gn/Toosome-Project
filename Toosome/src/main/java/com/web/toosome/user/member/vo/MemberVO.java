package com.web.toosome.user.member.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int memberId;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private Timestamp memberBirth;
	private String memberPhone;
	private String memberAddress;
	private String memberPlatformType;
	private Timestamp memberRegDate;
	private int memberStatus;
	private Timestamp memberLastLoginDate;
	private byte memberRepassword;

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public Timestamp getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(Timestamp memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPlatformType() {
		return memberPlatformType;
	}

	public void setMemberPlatformType(String memberPlatformType) {
		this.memberPlatformType = memberPlatformType;
	}

	public Timestamp getMemberRegDate() {
		return memberRegDate;
	}

	public void setMemberRegDate(Timestamp memberRegDate) {
		this.memberRegDate = memberRegDate;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public Timestamp getMemberLastLoginDate() {
		return memberLastLoginDate;
	}

	public void setMemberLastLoginDate(Timestamp memberLastLoginDate) {
		this.memberLastLoginDate = memberLastLoginDate;
	}

	public byte getMemberRepassword() {
		return memberRepassword;
	}

	public void setMemberRepassword(byte memberRepassword) {
		this.memberRepassword = memberRepassword;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberName=" + memberName + ", memberEmail=" + memberEmail
				+ ", memberPassword=" + memberPassword + ", memberBirth=" + memberBirth + ", memberPhone=" + memberPhone
				+ ", memberAddress=" + memberAddress + ", memberPlatformType=" + memberPlatformType + ", memberRegDate="
				+ memberRegDate + ", memberStatus=" + memberStatus + ", memberLastLoginDate=" + memberLastLoginDate
				+ ", memberRepassword=" + memberRepassword + "]";
	}

}

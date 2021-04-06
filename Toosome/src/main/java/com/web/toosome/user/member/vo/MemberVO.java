package com.web.toosome.user.member.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private Integer memberId;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private Date memberBirth;
	private String memberPhone;
	private String memberAddress;
	private String platFormType;
	private Date regDate;
	private Integer status;
	private Date lastLoginDate;
	private Integer memberRePassword;
	private Integer memberEnabled;
	private List<AuthVO> authList;
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
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
	public Date getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(Date memberBirth) {
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
	public String getPlatFormType() {
		return platFormType;
	}
	public void setPlatFormType(String platFormType) {
		this.platFormType = platFormType;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public Integer getMemberRePassword() {
		return memberRePassword;
	}
	public void setMemberRePassword(Integer memberRePassword) {
		this.memberRePassword = memberRePassword;
	}
	public Integer getMemberEnabled() {
		return memberEnabled;
	}
	public void setMemberEnabled(Integer memberEnabled) {
		this.memberEnabled = memberEnabled;
	}
	public List<AuthVO> getAuthList() {
		return authList;
	}
	public void setAuthList(List<AuthVO> authList) {
		this.authList = authList;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberName=" + memberName + ", memberEmail=" + memberEmail
				+ ", memberPassword=" + memberPassword + ", memberBirth=" + memberBirth + ", memberPhone=" + memberPhone
				+ ", memberAddress=" + memberAddress + ", platFormType=" + platFormType + ", regDate=" + regDate
				+ ", status=" + status + ", lastLoginDate=" + lastLoginDate + ", memberRePassword=" + memberRePassword
				+ ", memberEnabled=" + memberEnabled + ", authList=" + authList + "]";
	}
	
	
	
}
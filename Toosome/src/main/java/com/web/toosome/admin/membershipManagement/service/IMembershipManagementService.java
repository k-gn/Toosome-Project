package com.web.toosome.admin.membershipManagement.service;

import java.util.List;

import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.user.membership.vo.MembershipVO;

public interface IMembershipManagementService {

	public List<MembershipVO> getMembershipMember(MembershipSearchVO search);
}

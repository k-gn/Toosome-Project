package com.web.toosome.user.membership.vo;

import lombok.Data;

@Data
public class MembershipVO {

	private Integer membershipId;
	private Integer memberId;
	private Integer leverId;
	private Integer membershipPoint;
	private LevelVO level;
	
}

package com.web.toosome.user.membership.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.web.toosome.user.member.vo.MemberVO;

import lombok.Data;

@Data
public class MembershipVO {

	private Integer membershipId;
	private Integer memberId;
	private Integer levelId;
	private Integer membershipPoint;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date membershipRegDate;
	private LevelVO level;
	private MemberVO member;
	
}

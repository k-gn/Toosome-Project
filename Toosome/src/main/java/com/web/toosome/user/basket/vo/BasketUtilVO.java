package com.web.toosome.user.basket.vo;

import java.util.ArrayList;
import java.util.List;

import com.web.toosome.user.membership.vo.MembershipVO;

import lombok.Data;

@Data
public class BasketUtilVO {

	private List<String> ImagePath = new ArrayList<>();
	private MembershipVO membershipVO;
}

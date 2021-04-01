package com.web.toosome.user.membership.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberShipController {
	@GetMapping("/membership") 
	public String memberShip() {
		return "subpages/memberShip/memberShip";
	}
}

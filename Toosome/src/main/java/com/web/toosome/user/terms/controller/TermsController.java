package com.web.toosome.user.terms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.toosome.user.terms.service.ITermsService;
import com.web.toosome.user.terms.vo.TermsVO;

@Controller
public class TermsController {
	
	@Autowired
	private ITermsService termsService;
	
	@GetMapping("/agreement") //약관페이지
	public String agreement(TermsVO termsVO, Model model) {
		System.out.println("TERMS 내용가져오기 : Controller");
		List<TermsVO> termsList = termsService.getTermsList(termsVO);
		model.addAttribute("termsList",termsList);
		return "subpages/agreement/agreement";
	}
}

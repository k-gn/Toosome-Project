package com.web.toosome.user.terms.service;

import java.util.List;

import com.web.toosome.user.terms.vo.TermsVO;

public interface ITermsService {
	// 약관가져오기
	public List<TermsVO> getTermsList(TermsVO vo);
}

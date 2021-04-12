package com.web.toosome.user.terms.dao;

import java.util.List;

import com.web.toosome.user.terms.vo.TermsVO;

public interface ITermsMapper {
	
	// 약관 가져오기
	public List<TermsVO> getTermsList(TermsVO vo); 
}

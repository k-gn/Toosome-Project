package com.web.toosome.admin.settings.service;

import java.util.List;

import com.web.toosome.user.terms.vo.TermsVO;

public interface ISettingService {

	public List<TermsVO> getTermList();
	
	public int addTerm(TermsVO term);
}

package com.web.toosome.admin.settings.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.admin.settings.dao.ISettingMapper;
import com.web.toosome.user.terms.vo.TermsVO;

@Service
public class SettingService implements ISettingService {

	@Autowired
	private ISettingMapper mapper;

	@Override
	public List<TermsVO> getTermList() {
		return mapper.getTermList();
	}

	@Override
	public int addTerm(TermsVO term) {
		return mapper.addTerm(term);
	}
	
	
}

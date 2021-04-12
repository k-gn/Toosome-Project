package com.web.toosome.user.terms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.toosome.user.terms.dao.ITermsMapper;
import com.web.toosome.user.terms.vo.TermsVO;

@Service
public class TermsService implements ITermsService {
	
	@Autowired
	private ITermsMapper mapper;
	
	@Override
	public List<TermsVO> getTermsList(TermsVO termsVO) {
		return mapper.getTermsList(termsVO);
	}


}

package com.web.toosome.admin.settings.dao;

import java.util.List;

import com.web.toosome.admin.settings.vo.BannerVO;
import com.web.toosome.user.terms.vo.TermsVO;

public interface ISettingMapper {

	// 전체 약관 조회
	public List<TermsVO> getTermList();
	
	// 약관 등록
	public int addTerm(TermsVO term);
	
	// 배너 전체 조회
	public List<BannerVO> getBannerList();
	
	// 배너 조회
	public BannerVO getBanner(Integer id);

	// 배너 등록
	public int addBanner(BannerVO banner);
	
	// 배너 수정
	public int modBanner(BannerVO banner);
	
	// 배너 삭제
	public int delBanner(Integer id);
	
}

package com.web.toosome.admin.settings.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.toosome.admin.settings.dao.ISettingMapper;
import com.web.toosome.admin.settings.vo.BannerListVO;
import com.web.toosome.admin.settings.vo.BannerVO;
import com.web.toosome.common.s3.S3Service;
import com.web.toosome.user.terms.vo.TermsVO;

@Service
public class SettingService implements ISettingService {

	@Autowired
	private ISettingMapper mapper;
	
	@Autowired
	private S3Service s3;
	
	private final String bannerPath = "img/pages/main/";

	@Override
	public List<TermsVO> getTermList() {
		return mapper.getTermList();
	}

	@Override
	public int addTerm(TermsVO term) {
		return mapper.addTerm(term);
	}

	@Override
	public List<BannerVO> getBannerList() {
		return mapper.getBannerList();
	}

	@Transactional
	@Override
	public int addBanner(BannerListVO bannerList) {
		int result = 0;
		for(BannerVO banner : bannerList.getBannerList()) {
			String bannerName = "";
			if(banner.getFile() != null) {
				bannerName = banner.getFile().getOriginalFilename();
			}
			
			if(banner.getBannerId() == null && !bannerName.equals("")) {
				System.out.println("addBanner");
				banner.setBannerName(bannerName);
				s3.upload(banner.getFile(), bannerPath);
				result = mapper.addBanner(banner);
				
			} else if(banner.getBannerId() != null)  {
				System.out.println("modBanner");
				if(bannerName.equals("")) {
					banner.setBannerName(banner.getOriginImgName());
				}else {
					banner.setBannerName(bannerName);
					s3.upload(banner.getFile(), bannerPath);
				}
				result = mapper.modBanner(banner);
			}
		}
		return result;
	}

	@Override
	public int delBanner(Integer id) {
		BannerVO banner = mapper.getBanner(id);
		int result = mapper.delBanner(id);
		s3.delete(banner.getBannerRoute().substring(1) + banner.getBannerName());
		return result;
	}
	
	
}

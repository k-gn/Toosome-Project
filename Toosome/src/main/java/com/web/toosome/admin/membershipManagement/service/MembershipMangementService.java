package com.web.toosome.admin.membershipManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.toosome.admin.membershipManagement.dao.IMembershipManagementMapper;
import com.web.toosome.admin.membershipManagement.vo.MembershipSearchVO;
import com.web.toosome.common.S3Service;
import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

@Service
public class MembershipMangementService implements IMembershipManagementService {

	@Autowired
	private IMembershipManagementMapper mapper;
	
	@Autowired
	private S3Service s3;
	
	private final String tierPath = "img/pages/subpages/membership/tier/";
	
	@Override
	public List<MembershipVO> getMembershipMemberList(MembershipSearchVO search) {
		return mapper.getMembershipMemberList(search);
	}

	@Override
	public MembershipVO getMembershipMember(Integer id) {
		return mapper.getMembershipMember(id);
	}

	@Override
	public int updateMembership(MembershipVO membership) {
		return mapper.updateMembership(membership);
	}

	@Override
	public LevelVO getLevel(Integer id) {
		return mapper.getLevel(id);
	}

	@Transactional
	@Override
	public int insertLevel(LevelVO level) {
		
		LevelVO maxLvl = mapper.getLevel(mapper.countLevel());
		LevelVO maxPrevLvl = mapper.getLevel(mapper.countLevel() - 1);
		maxLvl.setLevelMaxRange(maxLvl.getLevelMinRange() + (maxPrevLvl.getLevelMaxRange() - maxPrevLvl.getLevelMinRange()));
		mapper.updateLevel(maxLvl);
		
		mapper.aiReset();
		String imgName = level.getFile().getOriginalFilename();
		if(imgName != null && !imgName.equals("")) {
			s3.upload(level.getFile(), tierPath);
			level.setLevelImg(level.getFile().getOriginalFilename());
		}
		return mapper.insertLevel(level);
	}

	@Override
	public int updateLevel(LevelVO level) {
		String imgName = level.getFile().getOriginalFilename();
		if(imgName != null && !imgName.equals("")) {
			s3.upload(level.getFile(), tierPath);
			level.setLevelImg(level.getFile().getOriginalFilename());
		}
		return mapper.updateLevel(level);
	}

	@Override
	public int countLevel() {
		return mapper.countLevel();
	}

	@Override
	public List<LevelVO> getLevelList() {
		return mapper.getLevelList();
	}
	

}

package com.web.toosome.user.member.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.toosome.admin.memberManagement.dao.IMemberManageMapper;
import com.web.toosome.user.basket.dao.IBasketMapper;
import com.web.toosome.user.board.dao.IQnaBoardMapper;
import com.web.toosome.user.member.dao.IMemberMapper;
import com.web.toosome.user.member.vo.MemberVO;
import com.web.toosome.user.membership.dao.IMembershipMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService implements IMemberService {

	@Autowired
	private IMemberMapper mapper;
	
	@Autowired
	private IMembershipMapper msmapper;
	
	@Autowired
	private IBasketMapper bmapper;
	
	@Autowired
	private IQnaBoardMapper qmapper;
	
	@Autowired
	private IMemberManageMapper mmapper;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 이메일 중복 확인
	@Override
	public boolean emailDupCheck(String email) {
		boolean flag = true;
		int result = mapper.emailDupCheck(email);
		if (result > 0)
			flag = false;
		return flag;
	}

	// 회원 등록 (사용자)
	@Transactional
	@Override
	public int registerMember(MemberVO member) {
		if (member.getMemberPassword() != null) {
			String encodePassword = bCryptPasswordEncoder.encode(member.getMemberPassword());
			member.setMemberPassword(encodePassword);
		}
		
		if(mmapper.getOutMemberByEmail(member.getMemberEmail()) != null) {
			mmapper.delOutMember(member.getMemberEmail());
		}
		
		int result = mapper.registerMember(member);
		mapper.registerMemberAuth(member.getMemberEmail());
		return result;
	}

	// 관리자
	@Transactional
	@Override
	public int registerAdmin(MemberVO member) {
		String encodePassword = bCryptPasswordEncoder.encode(member.getMemberPassword());
		member.setMemberPassword(encodePassword);
		int result = mapper.registerAdmin(member);
		mapper.registerAdminAuth(member.getMemberEmail());
		return result;
	}

	// 이메일로 회원 조회
	@Override
	public MemberVO getUserByEmail(String email) {
		return mapper.getUserByEmail(email);
	}
	
	@Override
	public void updateLastLogin(String email) {
		mapper.updateLastLogin(email);
	}

	// 아이디 찾기 & 비밀번호 찾기 인증 번호 전송
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String num) {
		String api_key = "NCSYDBSNPVO2LUFF";
		String api_secret = "KX2XFULHJHUWMWIETWORN3ZN0TD3K4LD";
		Message coolsms = new Message(api_key, api_secret);
		System.out.println("3");
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 발신번호
		params.put("from", "01056592176"); // 수신번호
		params.put("type", "SMS");
		params.put("text", "CoolSMS<br>" + "인증 번호는 " + num + "입니다." + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.");
		params.put("app_version", "test app 1.2"); // application name and version
		System.out.println("4");
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// 이미지 전송
	@Override
	public void sendImage(String phoneNumber) {
		String api_key = "NCSYDBSNPVO2LUFF";
		String api_secret = "KX2XFULHJHUWMWIETWORN3ZN0TD3K4LD";
		Message coolsms = new Message(api_key, api_secret);
		System.out.println("3");
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 발신번호
		params.put("from", "01056592176"); // 수신번호
		params.put("type", "MMS");
		params.put("text", "CoolSMS");
		params.put("app_version", "test app 1.2"); // application name and version
		params.put("image", "https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/productDetail/Untitled-1.jpg");
		System.out.println("4");
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// 아이디 찾기
	@Override
	public MemberVO getSMS(MemberVO vo) {
		return mapper.getSMS(vo);
	}

	// 이메일 찾기
	@Override
	public MemberVO getMail(MemberVO vo) {
		return mapper.getMail(vo);
	}

	// 비밀번호 찾기
	@Override
	public MemberVO getPassword(MemberVO vo) {
		return mapper.getPassword(vo);
	}

	// 비밀번호 찾기 랜덤비밀번호 전송
	@Override
	public int getRepassword(MemberVO vo) {
		String repass = bCryptPasswordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(repass);
		return mapper.getRepassword(vo);
	}

	// 플랫폼 타입 변경
	@Override
	public void updatePlatForm(String email, String type) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("type", type);
		mapper.updatePlatForm(map);
	}

	// 아이디로 회원 정보 조회
	@Override
	public MemberVO getUserById(Integer id) {
		return mapper.getUserById(id);
	}

	// 회원정보 수정
	@Override
	public int updateMember(MemberVO vo) {
		return mapper.updateMember(vo);
	}

	// 회원 탈퇴
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int deleteMember(String email, Integer id) {
		mapper.insertWithdrawInfo(mapper.getUserById(id));
		bmapper.delBasketById(id);
		msmapper.deleteMembership(id);
		qmapper.delQna(id);
		// 해당 회원 댓글 삭제 추가 예정
		mapper.deleteMemberAuth(email);
		int result = mapper.deleteMember(id);
		return result;
	}

	// 비밀번호 검증
	@Override
	public boolean passwordCheck(Integer id, String password) {
		boolean flag = false;
		String dbpassword = mapper.passwordCheck(id);
		if(bCryptPasswordEncoder.matches(password, dbpassword)) {
			flag = true;
			return flag;
		}else {
			return flag;
		}
	}

	@Override
	public int changePassword(Integer id, String newpassword) {
		Map<String, Object> map = new HashMap<>();
		String password = bCryptPasswordEncoder.encode(newpassword);
		map.put("id", id);
		map.put("newpassword", password);
		return mapper.changePassword(map);
	}

}

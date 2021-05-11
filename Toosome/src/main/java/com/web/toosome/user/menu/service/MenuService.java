package com.web.toosome.user.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import com.amazonaws.services.s3.transfer.Upload;
import com.web.toosome.user.menu.dao.IMenuMapper;
import com.web.toosome.user.menu.vo.MenuImageVO;
import com.web.toosome.user.menu.vo.MenuReviewBoardVO;
import com.web.toosome.user.menu.vo.MenuVO;

@Service
public class MenuService implements IMenuService {

	@Autowired
	private IMenuMapper mapper;

	public int s3Upload(MultipartFile file, String fname) {
		AmazonS3 amazonS3 = null;
		String bucket = null;

		AWSCredentials creds = new BasicAWSCredentials("AKIA2EEFD7LC3HPT4W5F",
				"HysDDMERwtehAGKvBMK35xeUr2NsM++Bwz66l615");
		amazonS3 = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(creds))
				.withRegion(Regions.AP_NORTHEAST_2) // region
				.withForceGlobalBucketAccessEnabled(true) // access
				.build();
		bucket = "toosome";
		TransferManager tm = TransferManagerBuilder.standard().withS3Client(amazonS3).build();
		PutObjectRequest request;
		try {
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setCacheControl("604800"); // 60*60*24*7 일주일
			metadata.setContentType("image/jpeg");
			request = new PutObjectRequest(bucket, fname, file.getInputStream(), metadata)
					.withCannedAcl(CannedAccessControlList.PublicRead);
			// amazonS3.putObject(request);
			Upload upload = tm.upload(request);
			upload.waitForCompletion();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<MenuVO> getnewList(MenuVO menuVO) {
		return mapper.getnewList(menuVO);
	}
	
	@Override
	public List<MenuVO> getbeverageList(MenuVO menuVO) {
		return mapper.getbeverageList(menuVO);
	}

	@Override
	public List<MenuVO> getdelhiList(MenuVO menuVO) {
		return mapper.getdelhiList(menuVO);
	}

	@Override
	public List<MenuVO> getdessertList(MenuVO menuVO) {
		return mapper.getdessertList(menuVO);
	}

	@Override
	public List<MenuVO> getwholecaketList(MenuVO menuVO) {
		return mapper.getwholecaketList(menuVO);
	}

	@Override
	public MenuVO getnewDetail(MenuVO menuVO) {
		return mapper.getnewDetail(menuVO);
	}

	@Override
	public MenuVO getmenuDetail(MenuVO menuVO) {
		return mapper.getmenuDetail(menuVO);
	}

	@Override
	public MenuVO getdelhiDetail(MenuVO menuVO) {
		return mapper.getdelhiDetail(menuVO);
	}

	@Override
	public MenuVO getdessertDetail(MenuVO menuVO) {
		return mapper.getdessertDetail(menuVO);
	}

	@Override
	public MenuVO getwholecakeDetail(MenuVO menuVO) {
		return mapper.getwholecakeDetail(menuVO);
	}

	@Override
	public MenuVO getimportList(MenuVO menuVO) {
		return mapper.getimportList(menuVO);
	}

	@Override
	public List<MenuVO> getIatListOne(MenuVO vo) {
		System.out.println("영양성분표1 리스트 출력 :" + mapper.getIatListOne(vo));
		return mapper.getIatListOne(vo);
	}

	@Override
	public List<MenuVO> getSearchIatListOne(MenuVO vo) {
		System.out.println("영양성분표1 검색 리스트 출력 : " + mapper.getSearchIatListOne(vo));
		return mapper.getSearchIatListOne(vo);
	}

	@Override
	public List<MenuVO> getIatListTwo(MenuVO vo) {
		System.out.println("영양성분표2 리스트 출력 : " + mapper.getIatListTwo(vo));
		return mapper.getIatListTwo(vo);
	}

	@Override
	public List<MenuVO> getSearchIatListTwo(MenuVO vo) {
		System.out.println("영양성분표2 검색 리스트 출력: " + mapper.getSearchIatListTwo(vo));
		return mapper.getSearchIatListTwo(vo);
	}
	
	@Override
	public List<MenuVO> getIatListThree(MenuVO vo) {
		System.out.println("영양성분표3 리스트 출력: " + mapper.getIatListThree(vo));
		return mapper.getIatListThree(vo);
	}

	@Override
	public List<MenuVO> getSearchIatListThree(MenuVO vo) {
		System.out.println("영양성분표3 검색 리스트 출력: " + mapper.getSearchIatListThree(vo));
		return mapper.getSearchIatListThree(vo);
	}
	
	@Override
	public List<MenuVO> getIatListFour(MenuVO vo) {
		System.out.println("영양성분표4 리스트 출력: " + mapper.getIatListFour(vo));
		return mapper.getIatListFour(vo);
	}

	@Override
	public List<MenuVO> getSearchIatListFour(MenuVO vo) {
		System.out.println("영양성분표4 검색 리스트 출력: " + mapper.getSearchIatListFour(vo));
		return mapper.getSearchIatListFour(vo);
	}

	@Override
	public int saveGift(MenuVO vo) {
		return mapper.saveGift(vo);
	}

	@Override
	public String getMenuMainTitle(Integer id) {
		return mapper.getMenuMainTitle(id);
	}

	@Override
	public int giftSendOrder(MenuVO vo) {
		return mapper.giftSendOrder(vo);
	}

	@Override
	public MenuImageVO getMenuImagePath(Integer id) {
		return mapper.getMenuImagePath(id);
	}

	@Override
	public int getOrdersId(Integer id) {
		return mapper.getOrdersId(id);
	}

	@Override
	public int getMenuPrice(Integer id) {
		return mapper.getMenuPrice(id);
	}

	@Override
	public MenuVO menuRatingAVG(MenuVO menuVO) {
		
		return mapper.menuRatingAVG(menuVO);
	}


	@Override
	public int delmenuById(Integer id){

		return mapper.delmenuById(id);
	}

	@Override
	public List<MenuReviewBoardVO> menuReviewList(Integer menuId) {

		return mapper.menuReviewList(menuId);
	}

	@Override
	public int menuReviewInsert(MenuReviewBoardVO menuReviewBoardVO) {

		return mapper.menuReviewInsert(menuReviewBoardVO);
	}

	@Override
	public int menuReviewUpdate(MenuReviewBoardVO menuReviewBoardVO) {

		return mapper.menuReviewUpdate(menuReviewBoardVO);
	}

	@Override
	public int menuReviewDelete(MenuReviewBoardVO menuReviewBoardVO) {

		return mapper.menuReviewDelete(menuReviewBoardVO);
	}

	@Override
	public MenuReviewBoardVO menuReviewSelect(Integer menuReviewBoardId) {

		return mapper.menuReviewSelect(menuReviewBoardId);
	}
	public MenuVO getmbtiMenu(String coffeeName) {
		return mapper.getmbtiMenu(coffeeName);
	}


	
	
}

package com.web.toosome.admin.settings.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BannerVO {

	private Integer bannerId;
	private String bannerRoute;
	private String bannerName;
	private String bannerTitle;
	private String originImgName;
	private MultipartFile file;
}

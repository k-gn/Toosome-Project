package com.web.toosome.user.board.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NewsBoardDetailVO {
	private Integer newsBoardDetailId;
	private String newsBoardDetailImageRoute;
	private String newsBoardDetailImageName;
	private String newsBoardDetailImageExtention;
	private Integer newsBoardDetailViewCount;
	private String newsBoardDetailTitle;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date newsBoardDetailRegdate;
	private MultipartFile uploadFile2;
}

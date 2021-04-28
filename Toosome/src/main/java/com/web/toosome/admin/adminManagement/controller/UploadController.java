package com.web.toosome.admin.adminManagement.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.plexus.components.io.fileselectors.FileInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

//@Controller
public class UploadController {
/*
	@GetMapping(path = "/download/{id}")
	public void fileDownload(@PathVariable(name = "id") Integer fileId, HttpServletResponse response) {

		FileInfo fileInfo = fileService.getFileInfo(fileId);
		// 파일 정보를 가지고 온다 ( 여기서 FileInfo는 스프링에 있는 자료형이 아니고 제가 만든 DTO 입니다 )

		String fileName = fileInfo.getFileName();
		// 파일 이름 가지고 오고
		String tempfileName = fileInfo.getSaveFileName();
		// 폴더까지 지정되어 있는 파일명 가져와서
		StringBuilder sb = new StringBuilder("c:/tmp/");
		sb.append(tempfileName);
		// 파일 저장되어 있는 경로뒤에 붙여줘서
		String saveFileName = sb.toString();
		// saveFileName을 만든다.

		String contentType = fileInfo.getContentType();
		// contentType 가져오고

		File file = new File(saveFileName);
		long fileLength = file.length();
		// 데이터베이스에 없는 정보는 파일로 만들어서 가져온다. 이 경우엔 Content-Length 가져온 것

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		// 그 정보들을 가지고 reponse의 Header에 세팅한 후

		try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) {
			// saveFileName을 파라미터로 넣어 inputStream 객체를 만들고
			// response에서 파일을 내보낼 OutputStream을 가져와서
			int readCount = 0;
			byte[] buffer = new byte[1024];
			// 파일 읽을 만큼 크기의 buffer를 생성한 후
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
				// outputStream에 씌워준다
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Load Error");
		}

	}*/
}

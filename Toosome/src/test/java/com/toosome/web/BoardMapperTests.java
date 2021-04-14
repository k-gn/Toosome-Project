
package com.toosome.web;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.toosome.user.board.dao.IBoardNoticeMapper;
import com.web.toosome.user.board.vo.NoticeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	
	@Setter(onMethod_ = @Autowired)
	private IBoardNoticeMapper mapper;
	
	@Test
	public void testNoticeBoardList(String index)throws Exception {
		System.out.println(index);
		mapper.getNoticeBoard(index);
		System.out.println(mapper.getNoticeBoard(index));

	}
}
